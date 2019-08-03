defmodule ReverseIntegerTest do
  use ExUnit.Case, async: true

  test "123 would be 321" do
    assert ReverseInteger.run(123) == 321
  end

  test "-123 would be -321" do
    assert ReverseInteger.run(-123) == -321
  end

  test "120 would be 21" do
    assert ReverseInteger.run(120) == 21
  end

  test "2147483648 would be 0" do
    assert ReverseInteger.run(2_147_483_648) == 0
  end

  test "-2147483648 would be 0" do
    assert ReverseInteger.run(-2_147_483_649) == 0
  end
end
