defmodule Day03 do
  use Input

  def part1() do
    all_lines = Enum.with_index(input_lines())

    all_lines
    |> Stream.flat_map(&structure_line/1)
    |> Stream.filter(&has_symbol_neighbour?(&1, all_lines))
    |> Stream.map(& &1.value)
    |> Enum.sum()
  end

  def part2() do
    all_lines = Enum.with_index(input_lines())

    all_lines
    |> Stream.flat_map(&structure_line/1)
    |> Stream.filter(&has_symbol_neighbour?(&1, all_lines))
    |> Stream.flat_map(&Enum.map(adjacent_gears(&1, all_lines), fn g -> {g, &1} end))
    |> Enum.group_by(&elem(&1, 0), &elem(&1, 1))
    |> Enum.filter(&(Enum.count(elem(&1, 1)) === 2))
    |> Enum.map(&Enum.reduce(elem(&1, 1), 1, fn c, acc -> c.value * acc end))
    |> Enum.sum()
  end

  def structure_line({line, index}) do
    structure_line(line, index)
  end

  def structure_line(line, index) do
    Enum.map(parse_line(line), fn {value, {at, length}} ->
      %{
        value: String.to_integer(value),
        at: at,
        str: value,
        length: length,
        row: index,
        row_length: String.length(line)
      }
    end)
  end

  def parse_line(line) do
    Enum.zip([
      List.flatten(Regex.scan(~r/(\d+)/, line, capture: :first)),
      List.flatten(Regex.scan(~r/(\d+)/, line, return: :index, capture: :first))
    ])
  end

  def neighbours(cell, total_rows) do
    row_above = Enum.map((cell.at - 1)..(cell.at + cell.length), &{&1, cell.row - 1})
    left = {cell.at - 1, cell.row}
    row_below = Enum.map((cell.at - 1)..(cell.at + cell.length), &{&1, cell.row + 1})
    right = {cell.at + cell.length, cell.row}
    all = row_above ++ [right] ++ Enum.reverse(row_below) ++ [left]

    Enum.filter(all, fn {x, y} ->
      x >= 0 && x < cell.row_length && y >= 0 && y < total_rows
    end)
  end

  def char_at({x, y}, all_lines) do
    char_at(x, y, all_lines)
  end

  def char_at(x, y, all_lines) do
    {row, _index} = Enum.at(all_lines, y)
    String.at(row, x)
  end

  def has_symbol_neighbour?(cell, all_lines) do
    cell
    |> neighbours(Enum.count(all_lines))
    |> Enum.map(&char_at(&1, all_lines))
    |> Enum.any?(&(&1 =~ ~r/[^\d\.]/))
  end

  def adjacent_gears(cell, all_lines) do
    cell
    |> neighbours(Enum.count(all_lines))
    |> Enum.filter(&(char_at(&1, all_lines) === "*"))
  end
end
