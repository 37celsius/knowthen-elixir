# tally = %{will_ferrell: 1, kristen_wiig: 2}

# # increment = fn num -> num + 1 end
# increment = fn amount ->
#   fn num -> num + amount end
# end

# # Update map, if will_ferrell does not exist, add 1 to the map, if it does exist, use increment function
# tally = Map.update(tally, :will_ferrell, 1, increment.(2))

# IO.puts(inspect(tally))

# defmodule Util do
#   def compose(data, outer_fun, inner_fun) do
#     outer_fun.(inner_fun.(data))
#   end
# end

defmodule Party do

  @mascots %{
    democratic: "donkey",
    republican: "elephant",
    libertarian: "statue",
    green: "plant",
    constitution: "eagle",
    whig: "owl"
  }

  @parties Map.keys(@mascots)

  def mascot(party) do
    @mascots[party]
  end

  # \\ is default value
  def logo(party, size \\ :normal)

  def logo(party, size) when party in @parties do
    party_mascot = mascot(party)
    do_logo(party_mascot, size)
  end

  def logo(_party, size), do: do_logo("other", size)

  defp do_logo(mascot, :small), do: "#{mascot}_small.png"
  defp do_logo(mascot, _other_size), do: "#{mascot}_normal.png"

end

# Example using Regex in sigil
sentence = "Elixir is really cool!"
regex = ~r/cool/
Regex.match?(regex, sentence)
