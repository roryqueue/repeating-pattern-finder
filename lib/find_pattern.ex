defmodule FindPattern do

  def shortest_repeating_pattern(input_string) do
    input_string
    |> ordered_possible_patterns
    |> Enum.filter(&pattern_matches?(&1, input_string))
    |> Enum.at(-1)
  end

  defp ordered_possible_patterns(input_string, patterns \\ [], counter \\ 0) do
    last_pattern_added = if length(patterns) < 1 do
      ""
    else
      [last | _rest] = patterns
      last
    end

    if last_pattern_added == input_string do
      patterns
    else
      ordered_possible_patterns(
        input_string,
        [String.slice(input_string, 0..counter) | patterns],
        counter + 1
      )
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
      match_section == String.slice(pattern, 0..(match_section_length - 1))
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