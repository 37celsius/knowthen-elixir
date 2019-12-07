# defmodule Util do
#   defmacro reverse({:+, context, [a, b]}) do
#     quote do
#       unquote(a) - unquote(b)
#     end
#   end
# end

# DO NOT USE THIS IN PRODUCTION/ DEVELOPMENT
# How to use in IEX:
# gas_tax = new("Gas Tax");
# -> %Proposition{description: "Gas Tax", yes: 0, no: 0}
# vote gas_tax + 1
# -> %Proposition{description: "Gas Tax", yes: 1, no: 0}

defmodule Proposition do
  defstruct [:description, yes: 0, no: 0]

  def new(description) do
    %Proposition{description: description}
  end

  defmacro vote({:+, _context, [prop, qty]}) do
    cast(prop, :yes, qty)
  end

  defmacro vote({:-, _context, [prop, qty]}) do
    cast(prop, :no, qty)
  end

  defp cast(prop, vote, qty) do
    quote do
      Map.update!(unquote(prop), unquote(vote), &(&1 + unquote(qty)))
    end
  end
end

# Better solution
defmodule Proposition do
  defstruct [:description, yes: 0, no: 0]

  def new(description) do
    %Proposition{description: description}
  end

  defp cast(prop, vote, qty) do
    Map.update!(prop, vote, &(&1 + qty))
  end
end
