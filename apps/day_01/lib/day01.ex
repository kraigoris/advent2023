defmodule Day01 do
  use Input

  def part1() do
    Enum.reduce(input_lines(), 0, fn line, acc ->
      acc + (first_number(line) * 10 + last_number(line))
    end)
  end

  def part2() do
    Enum.reduce(input_lines(), 0, fn line, acc ->
      acc + (first_number(line, words: true) * 10 + last_number(line, words: true))
    end)
  end

  def first_number(str, opts \\ []) do
    include_words? = Keyword.get(opts, :words, false)
    pattern_type = if include_words?, do: :words, else: :default
    pattern = get_pattern(pattern_type)
    to_number(run_regex(pattern, str))
  end

  def last_number(str, opts \\ []) do
    include_words? = Keyword.get(opts, :words, false)
    pattern_type = if include_words?, do: :reverse_words, else: :default
    pattern = get_pattern(pattern_type)
    to_number(run_regex(pattern, String.reverse(str)))
  end

  def run_regex(pattern, str) do
    case Regex.run(pattern, str, capture: :first) do
      [s] -> s
      nil -> nil
    end
  end

  def to_number(s) when s == "1" or s == "one" or s == "eno", do: 1
  def to_number(s) when s == "2" or s == "two" or s == "owt", do: 2
  def to_number(s) when s == "3" or s == "three" or s == "eerht", do: 3
  def to_number(s) when s == "4" or s == "four" or s == "ruof", do: 4
  def to_number(s) when s == "5" or s == "five" or s == "evif", do: 5
  def to_number(s) when s == "6" or s == "six" or s == "xis", do: 6
  def to_number(s) when s == "7" or s == "seven" or s == "neves", do: 7
  def to_number(s) when s == "8" or s == "eight" or s == "thgie", do: 8
  def to_number(s) when s == "9" or s == "nine" or s == "enin", do: 9
  def to_number(nil), do: 0

  def get_pattern(type \\ :default)
  def get_pattern(:default), do: ~r/\d/
  def get_pattern(:words), do: ~r/(\d|one|two|three|four|five|six|seven|eight|nine)/
  def get_pattern(:reverse_words), do: ~r/(\d|enin|thgie|neves|xis|evif|ruof|eerht|owt|eno)/
end
