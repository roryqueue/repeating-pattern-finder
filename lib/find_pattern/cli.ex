defmodule FindPattern.CLI do
  def main(args) do
    input_string = if length(args) > 0 do
      List.first(args)
    else
      "" |> IO.gets |> String.trim
    end

    input_string
    |> FindPattern.shortest_repeating_pattern
    |> IO.puts
  end
end