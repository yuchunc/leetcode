defmodule LongestPalindromeTest do
  use ExUnit.Case, async: true

  test "babad is bab" do
    assert LongestPalindrome.find("babad") == "bab" || "aba"
  end

  test "cbbd is bb" do
    assert LongestPalindrome.find("cbbd") == "bb"
  end

  test "abacdfgdcaba is aba" do
    assert LongestPalindrome.find("abacdfgdcaba") == "aba"
  end
end
