length = IO.gets("length of rectangle? ")
width = IO.gets("width of rectangle? ")

{lengthNum, _parse } = Float.parse(length)
{widthNum, _parse } = Float.parse(width)

IO.puts("The area is #{lengthNum * widthNum}")
