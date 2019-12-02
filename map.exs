defmodule Util do
  import Enum, only: [reverse: 1]
  def map(list, fun) when is_list(list), do: do_map(list, fun)

  defp do_map(list, new_list \\ [])
  # Base case that will stop the recursion
  defp do_map([], new_list, _fun), do: reverse(new_list)
  # Recursion
  defp do_map([head | tail], new_list, fun), do: do_map(tail, [fun.(head) | new_list], fun)
end

list = [1,2,3,4,5]

doubled = Util.double(list, fn x -> x * 2 end)

IO.puts(inspect(doubled))
