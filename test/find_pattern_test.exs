defmodule FindPatternTest do
  use ExUnit.Case
  doctest FindPattern

  test "Example 1: ababababab" do
    assert FindPattern.shortest_repeating_pattern("ababababab") === "ab"
  end

  test "Example 2: accaccaccacc" do
    assert FindPattern.shortest_repeating_pattern("accaccaccacc") === "acc"
  end

  test "Example 3: 1233211233211" do
    assert FindPattern.shortest_repeating_pattern("1233211233211") === "123321"
  end

  test "Example 4: 0001000100" do
    assert FindPattern.shortest_repeating_pattern("0001000100") === "0001"
  end

  test "Example 5: 1234567" do
    assert FindPattern.shortest_repeating_pattern("1234567") === "1234567"
  end

  test "Example 6: ababdbabb" do
    assert FindPattern.shortest_repeating_pattern("ababdbabb") === "ababdbabb"
  end

  test "Example 7: ababcabab" do
    assert FindPattern.shortest_repeating_pattern("ababcabab") === "ababc"
  end

  test "Example 8: 1232123" do
    assert FindPattern.shortest_repeating_pattern("1232123") === "1232"
  end

  test "Example 9: aaaabaa" do
    assert FindPattern.shortest_repeating_pattern("aaaabaa") === "aaaab"
  end
end
