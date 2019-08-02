defmodule NoRepeatSubStrLengthTest do
  use ExUnit.Case, async: true

  test "'abcabcbb' is 3" do
    assert NoRepeatSubStrLength.find("abcabcbb") == 3
  end

  test "'bbbbb' is 1" do
    assert NoRepeatSubStrLength.find("bbbbb") == 1
  end

  test "'pwwkew' is 3" do
    assert NoRepeatSubStrLength.find("pwwkew") == 3
  end
end
