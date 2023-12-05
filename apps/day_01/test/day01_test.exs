defmodule Day01Test do
  use ExUnit.Case

  describe "Day01.part01()" do
    test "should return correct result" do
      assert Day01.part1() === 55108
    end
  end

  describe "Day01.part02()" do
    test "should return correct result" do
      assert Day01.part2() === 56324
    end
  end
end
