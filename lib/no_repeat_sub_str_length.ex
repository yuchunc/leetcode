defmodule NoRepeatSubStrLength do
  # NOTE Algorithm 3

  def find(str) do
    str
    |> String.graphemes
    |> Enum.reduce([[]], fn(char, acc = [h | t]) ->
      if char in h do
        [[char] | acc]
      else
        [[char | h] | t]
      end
    end)
    |> Enum.map(&length/1)
    |> Enum.max
  end
end
