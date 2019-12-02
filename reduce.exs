list = [1,2,3,4]

# Options or the way to write reduce function reduce /2

# sum = Enum.reduce(list, fn x, acc -> x + acc end)
# sum = Enum.reduce(list, &(&1 + &2))
sum = Enum.reduce(list, &+/2)


IO.puts(sum)
