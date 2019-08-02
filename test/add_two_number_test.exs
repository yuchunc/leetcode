defmodule AddTwoNumberTest do
  use ExUnit.Case, async: true

  test "list [2, 4, 3] add [5, 6, 4] results [7, 0, 8]" do
    assert AddTwoNumber.combine([2, 4, 3], [5, 6, 4]) == [7, 0, 8]
  end

  test "list [1, 3, 4] add [8, 2, 3] results [9, 5, 7]" do
    assert AddTwoNumber.combine([1, 3, 4], [8, 2, 3]) == [9, 5, 7]
  end
end
