# Example
# import Integer, only: [is_even: 1]

# list1 = [1,2,3,4]
# list2 = [5,6,7,8]

# # Normal way
# list3 =
#   list1
#   |> Enum.filter(&is_even/1)
#   |> Enum.map(fn x ->
#     list2
#     |> Enum.filter(&is_even/1)
#     |> Enum.map(&(&1 * x))
#   end)
#   |> Enum.flat_map(&(&1))

# # Using comprehension
# list4 =
#   for x <- list1, y <- list2, is_even(x), is_even(y), do: x * y


propositions = [
  %{id: 1, state: "CA", description: "Highway Bond"},
  %{id: 2, state: "CA", description: "Eliminate Daylight Savings"},
  %{id: 3, state: "CA", description: "Fuel Tax"},
  %{id: 4, state: "WA", description: "Carbon Tax"},
  %{id: 5, state: "WA", description: "Grocery Tax"}
]

locations = [
  %{id: 1, state: "CA", address: "755 Morse St", ballot_type: 20},
  %{id: 2, state: "CA", address: "200 Onondaga Ave", ballot_type: 10},
  %{id: 3, state: "CA", address: "1251 Geneva Ave", ballot_type: 30},
  %{id: 4, state: "WA", address: "62 Santa Rosa St", ballot_type: 30},
]

state = "CA"
ballot_type = [20, 38]

polling_props =
  for prop = %{state: ^state} <- propositions,
      location = %{state: state} <- locations,
      location.ballot_type in ballot_type do
        %{
          prop_id: prop.id,
          state: state,
          prop_description: prop.description,
          location_id: location.id,
          address: location.address
        }
      end
