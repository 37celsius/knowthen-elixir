age = IO.gets("What is your age? ")
{age, _} = Integer.parse(age)

# message =
  # cond do
  #   age < 18 -> "You can't vote yet"
  #   age < 25  -> "You can vote!"
  #   true -> "You can vote and you can run for office!"
  # end
  # case Integer.parse(age) do
  #   {age, _} when age < 18 -> "You can't vote yet"
  #   {age, _} when age < 25 -> "You can vote!"
  #   {_age, _} -> "You can vote and you can run for office!"
  #   :error -> "Invalid number"
  # end

# This is anonymous function
# voter_eligibility = fn(age) ->
#   case Integer.parse(age) do
#     {age, _} when age < 18 -> "You can't vote yet"
#     {age, _} when age < 25 -> "You can vote"
#     {_age, _} -> "You can vote and you can run for office!"
#     :error -> "Invalid number"
#   end
# end

# defmodule Voter do
#   def elgibility(age) do
#     case Integer.parse(age) do
#       {age, _} when age < 18 -> "You can't vote yet"
#       {age, _} when age < 25 -> "You can vote"
#       {_age, _} -> "You can vote and you can run for office!"
#       :error -> "Invalid number"
#     end
#   end
# end

# Using pattern matching in function
defmodule Voter do
  @moduledoc """
    Functions for working with voters.
  """

  @doc """
    Descirbes a voters eligibiity based on an age

  ## Parameters
    - age: Integer or String that represents a persons age

  Return `String`.

  ## Examples

    iex> Voter.eligibility(17)
    "You can't vote yet"
  """
  def eligibility(age) when is_binary(age) or is_integer(age) do
    do_eligibility(age)
  end

  def eligibility(_age) do
    "Invalid input"
  end

  defp do_eligibility(age) when is_binary(age) do
    eligibility(Integer.parse(age))
  end

  defp do_eligibility({age, _}) do
    eligibility(age)
  end

  defp do_eligibility(age) when is_integer(age) and age < 18 do
    "You can't vote yet"
  end

  defp do_eligibility(age) when is_integer(age) and age < 25 do
    "You can vote"
  end

  defp do_eligibility(:error) do
    "Invalid number"
  end

  defp do_eligibility(_age) do
    "You can vote and you can run for office!"
  end
end

message = voter.eligibility(age)

IO.put message
