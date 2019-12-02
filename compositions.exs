district_candidate_votes = [
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

candidate_totals =
  district_candidate_votes
  |> Enum.filter(&(&1.disctrict in [1,2]))
  |> IO.inspect(label: "Filtered")
  |> Enum.map(&Map.take(&1, [:candidate, :votes]))
  |> IO.inspect(label: "Mapped")
  |> Enum.group_by(&(&1.candidate), &(&1.votes))
  |> IO.inspect(label: "Group by")
  |> Enum.map(fn {k, v} -> {k, Enum.sum(v)} end)
  |> IO.inspect(label: "Mapped, Summed")
  |> Enum.into(%{})
  |> IO.inspect(label: "Into")

IO.inspect(candidate_totals)
