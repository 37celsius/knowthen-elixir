logo_file = fn
  (:democrat) -> "donkey.png"
  (:republican) -> "elephant.png"
  (:libertarian) -> "statue.png"
  (:green) -> "flower.png"
  _ -> "missing.png"
end

defmodule Math do
  def add(a,b) do
    a + b
  end

  def increment(num) do
    add = fn a,b ->
      IO.puts("This is anonymouse function")
      a + b
    end

    # This will call add function outside increment function
    add(num, 1)

    # This will call anonymouse function inside this function
    add.(num, 1)
  end
end

file = logo_file.(:libertarian)

IO.puts(file)
