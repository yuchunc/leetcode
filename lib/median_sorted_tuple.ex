defmodule MedianSortedTuple do
  # NOTE Alogorithm 4

  def find({}, {}), do: 0

  def find(tup1, tup2) do
    full_size = tuple_size(tup1) + tuple_size(tup2)

    median_at =
      if rem(full_size, 2) == 1 do
        {:odd, div(full_size, 2)}
      else
        {:even, div(full_size, 2)}
      end

    find_median(median_at, {tup1, tuple_size(tup1) - 1}, {tup2, tuple_size(tup2) - 1})
  end

  defp find_median({:odd, 0}, tup1_info, tup2_info) do
    {val, _, _} = step(tup1_info, tup2_info)
    val / 1.0
  end

  defp find_median({:even, 1}, tup1_info, tup2_info) do
    {tup1, _} = tup1_info
    {tup2, _} = tup2_info

    {val1, pos1_1, pos2_1} = step(tup1_info, tup2_info)
    {val2, _, _} = step({tup1, pos1_1}, {tup2, pos2_1})

    (val1 + val2) / 2.0
  end

  defp find_median({e_o, steps}, tup1_info, tup2_info) do
    {tup1, _} = tup1_info
    {tup2, _} = tup2_info

    {_val1, pos1_1, pos2_1} = step(tup1_info, tup2_info)
    find_median({e_o, steps - 1}, {tup1, pos1_1}, {tup2, pos2_1})
  end

  defp step({_tup1, -1}, {tup2, pos2}), do: {elem(tup2, pos2), -1, pos2 - 1}
  defp step({tup1, pos1}, {_tup2, -1}), do: {elem(tup1, pos1), pos1 - 1, -1}

  defp step({tup1, pos1}, {tup2, pos2}) do
    val1 = elem(tup1, pos1)
    val2 = elem(tup2, pos2)

    if val1 >= val2 do
      {val1, pos1 - 1, pos2}
    else
      {val2, pos1, pos2 - 1}
    end
  end
end
