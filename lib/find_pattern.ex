defmodule FindPattern do

  def shortest_repeating_pattern(input_string, counter \\ 0) do
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

    {match_section, remainder} = String.split_at(string_to_match, pattern_length)
    match_section_length = String.length(match_section)

    if match_section_length < pattern_length do
      match_section === String.slice(pattern, 0..(match_section_length - 1))
    else
      if match_section === pattern do
        if remainder === "" do
          true
        else
          pattern_matches?(pattern, remainder, pattern_length)
        end
      else
        false
      end
    end
  end

end