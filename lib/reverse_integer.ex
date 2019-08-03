defmodule ReverseInteger do
  # NOTE 7. Reverse Integer

  def run(0), do: 0

  def run(int) do
    is_neg =
      if int > 0 do
        false
      else
        true
      end

    abs_rev_int =
      int
      |> abs
      |> Integer.digits()
      |> Enum.reverse()
      |> Integer.undigits()

    rev_int =
      if is_neg do
        abs_rev_int * -1
      else
        abs_rev_int
      end

    if rev_int |> Integer.digits(2) |> Enum.count() >= 32 do
      0
    else
      rev_int
    end
  end
end
