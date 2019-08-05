defmodule Atoi do
  # NOTE 8. String to Integer (atoi)

  def convert(str) do
    str_int =
      str
      |> String.trim()
      |> String.split()
      |> List.first()

    if Regex.match?(~r/\d/, str_int) do
      String.to_integer(str_int)
      |> set_boundaries
    else
      0
    end
  end

  defp set_boundaries(int) when int > 2_147_483_647, do: 2_147_483_647
  defp set_boundaries(int) when int < -2_147_483_648, do: -2_147_483_648

  defp set_boundaries(int), do: int
end
