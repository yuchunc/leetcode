defmodule TwoSum do
  def find_position([], _), do: :not_found

  def find_position([_h | []], _target), do: :not_found

  def find_position([{num, pos} | t], target) do
    case has_sum(t, num, target) do
      nil -> find_position(t, target)
      pos_2 -> [pos, pos_2]
    end
  end

  def find_position(numbers, target) do
    numbers
    |> Enum.with_index
    |> find_position(target)
  end

  defp has_sum([], _, _), do: nil

  defp has_sum([{num2, pos2} | t], num1, target) when num1 + num2 == target, do: pos2

  defp has_sum([_ | t], num1, target), do: has_sum(t, num1, target)
end
