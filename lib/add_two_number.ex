defmodule AddTwoNumber do
  def combine(list1, list2) do
    {new_list, _} =
      Enum.zip(list1, list2)
      |> Enum.map(fn {num1, num2} -> num1 + num2 end)
      |> Enum.map_reduce(0, fn sum, tmp ->
        sum1 = sum + tmp

        if sum1 > 9 do
          {sum1 - 10, 1}
        else
          {sum1, 0}
        end
      end)

    new_list
  end
end
