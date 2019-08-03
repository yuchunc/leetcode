defmodule MedianSortedTuple do
  # NOTE Alogorithm 4

  def attempt2(tup1, tup2) do
    size1 = tuple_size(tup1)
    size2 = tuple_size(tup2)

    half_size = (size1 + size2 + 1) |> div(2)

    if size1 > size2 do
      binary_search(tup2, tup1, 0, size2, half_size)
    else
      binary_search(tup1, tup2, 0, size1, half_size)
    end
  end

  defp binary_search(x, y, x_min, x_max, half_size) do
    x_part =
      if x_min > x_max do
        x_min
      else
        div(x_min + x_max, 2)
      end

    y_part = half_size - x_part

    {x_l, x_r} = get_edge_values(x, x_part)

    {y_l, y_r} = get_edge_values(y, y_part)

    cond do
      x_l <= y_r and y_l <= x_r ->
        if rem(tuple_size(x) + tuple_size(y), 2) == 1 do
          Enum.max([x_l, y_l]) / 1
        else
          (Enum.max([x_l, y_l]) + Enum.min([x_r, y_r]))
          |> Kernel./(2)
        end

      x_l > y_r ->
        binary_search(x, y, x_min, x_part - 1, half_size)

      y_l > x_r ->
        binary_search(x, y, x_part + 1, x_max, half_size)
    end
  end

  defp get_edge_values(tup, 0), do: {-1, elem(tup, 0)}
  # this is a hack
  defp get_edge_values(tup, part) when tuple_size(tup) == part,
    do: {elem(tup, part - 1), :infinite}

  defp get_edge_values(tup, part), do: {elem(tup, part - 1), elem(tup, part)}

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
