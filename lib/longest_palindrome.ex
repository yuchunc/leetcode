defmodule LongestPalindrome do
  # NOTE Alogorithm 5

  def find(""), do: :empty_string

  def find(str) do
    1..String.length(str)
    |> Enum.reverse()
    |> longest_palindrome(str)
  end

  defp longest_palindrome([], _), do: :no_palindrome

  defp longest_palindrome([sub_size | t], str) do
    palindromes =
      Enum.reduce(0..(String.length(str) - sub_size), [], fn pos, acc ->
        sub_str = String.slice(str, pos, sub_size)

        if sub_str == String.reverse(sub_str) do
          [sub_str | acc]
        else
          acc
        end
      end)

    if palindromes == [] do
      longest_palindrome(t, str)
    else
      List.first(palindromes)
    end
  end
end
