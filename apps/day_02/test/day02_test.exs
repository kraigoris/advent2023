defmodule Day02Test do
  use ExUnit.Case

  describe "Day02.part1()" do
    test "should return correct result" do
      assert Day02.part1() === 1931
    end
  end

  describe "Day02.part2()" do
    test "should return correct result" do
      assert Day02.part2() === 83105
    end
  end
end
