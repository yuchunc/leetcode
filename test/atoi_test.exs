defmodule AtoiTest do
  use ExUnit.Case, async: true

  test "'42' to 42" do
    assert Atoi.convert("42") == 42
  end

  test "'   -42' to -42" do
    assert Atoi.convert("    -42") == -42
  end

  test "'4193 with words' to 4193" do
    assert Atoi.convert("4193 with words") == 4193
  end

  test "'words and 987' to 0" do
    assert Atoi.convert("words and 987") == 0
  end

  test "'-91283472332' to -2147483648" do
    assert Atoi.convert("-91283472332") == -2_147_483_648
  end
end
