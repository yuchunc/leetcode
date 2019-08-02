defmodule TwoSumTest do
  use ExUnit.Case, async: true

  test "returns the two position top produce sum of 9" do
    assert TwoSum.find_position([2, 7, 11, 15], 9) == [0, 1]
  end

  test "returns another two position top produce another sum" do
    assert TwoSum.find_position([2, 7, 11, 15], 13) == [0, 2]
  end
end
