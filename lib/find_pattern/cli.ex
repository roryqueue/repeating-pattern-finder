defmodule FindPattern.CLI do
  @moduledoc """
    Applies the shortest-repeating-pattern finder to a command line
    argument. If no argument is submitted, will read from stdin.
  """

  @spec main(list) :: atom
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
