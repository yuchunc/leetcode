defmodule MedianSortedTupleTest do
  use ExUnit.Case, async: true

  test "{1, 3} and {2} results 2.0" do
    assert MedianSortedTuple.attempt2({1, 3}, {2}) == 2.0
  end

  test "{1, 2} and {3, 4} results 2.5" do
    assert MedianSortedTuple.attempt2({1, 2}, {3, 4}) == 2.5
  end

  test "{1, 2, 5, 8, 10} and {3, 4, 6} results 4.5" do
    tup1 = {1, 2, 5, 8, 10}
    tup2 = {3, 4, 6}
    assert MedianSortedTuple.attempt2(tup1, tup2) == 4.5
  end
end
