defmodule FindPattern do
  @moduledoc """
    A program that finds the shortest repeating pattern in an input string.
    The input string will contain one or more complete copies of the pattern,
    possibly followed by a truncated copy.

    Example inputs and outputs:
      ababababab    -> ab
      accaccaccacc  -> acc
      1233211233211 -> 123321
      0001000100    -> 0001
      1234567       -> 1234567
      ababdbabb     -> ababdbabb
      ababcabab     -> ababc
      1232123       -> 1232
      aaaabaa       -> aaaab
  """

  @spec shortest_repeating_pattern(charlist) :: charlist
  def shortest_repeating_pattern(input_string) do
    shortest_repeating_pattern(input_string, 0)
  end

  defp shortest_repeating_pattern(input_string, counter) do
    test_pattern = String.slice(input_string, 0..counter)

    if pattern_matches?(test_pattern, input_string) do
      test_pattern
    else
      shortest_repeating_pattern(input_string, counter + 1)
    end
  end

  defp pattern_matches?(pattern, string_to_match, pattern_length \\ nil) do
    pattern_length = if is_nil(pattern_length) do
      String.length(pattern)
    else
      pattern_length
    end

    {match_section, remainder} =
      String.split_at(string_to_match, pattern_length)
    match_section_length = String.length(match_section)

    if match_section_length < pattern_length do
      match_section === String.slice(pattern, 0..(match_section_length - 1))

    else
      cond do
        match_section !== pattern ->
          false
        remainder === "" ->
          true
        true ->
          pattern_matches?(pattern, remainder, pattern_length)
      end
    end
  end
end
