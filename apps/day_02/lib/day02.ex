defmodule Day02 do
  use Input

  def part1() do
    games()
    |> Enum.filter(fn game -> Enum.all?(game.rounds, &contained?/1) end)
    |> Enum.reduce(0, &(&1.id + &2))
  end

  def part2() do
    games()
    |> Enum.map(&min_set_of_cubes/1)
    |> Enum.sum()
  end

  def min_set_of_cubes(game) do
    max_red = Enum.max(Enum.map(game.rounds, & &1.red))
    max_green = Enum.max(Enum.map(game.rounds, & &1.green))
    max_blue = Enum.max(Enum.map(game.rounds, & &1.blue))
    max_red * max_green * max_blue
  end

  def contained?(round) do
    max_red = 12
    max_green = 13
    max_blue = 14
    round.red <= max_red && round.green <= max_green && round.blue <= max_blue
  end

  def games() do
    for line <- input_lines(), do: parse_game(line)
  end

  def parse_game(str) do
    ["Game " <> id, rounds] = String.split(str, ": ")
    id = String.to_integer(id)
    rounds = Enum.map(String.split(rounds, "; "), &parse_round/1)
    %{id: id, rounds: rounds}
  end

  def parse_round(str) do
    map = for roll <- String.split(str, ", "), into: %{}, do: parse_roll(roll)
    %{red: map[:red] || 0, green: map[:green] || 0, blue: map[:blue] || 0}
  end

  def parse_roll(str) do
    [value, color] = String.split(str, " ")
    {String.to_atom(color), String.to_integer(value)}
  end
end
