votes = [
  %{district: 1, candidate: 1, votes: 100},
  %{district: 1, candidate: 2, votes: 120},
  %{district: 1, candidate: 1, votes: 30},
  %{district: 2, candidate: 3, votes: 40},
  %{district: 2, candidate: 2, votes: 160},
  %{district: 2, candidate: 1, votes: 180},
  %{district: 3, candidate: 2, votes: 300},
  %{district: 3, candidate: 3, votes: 10},
  %{district: 3, candidate: 1, votes: 76}
]

# filtered_list = Enum.filter(votes, fn x -> x.candidate == 3 end)
filtered_list = Enum.filter(votes, &(&1.candidate == 3))

IO.inspect(filtered_list)
