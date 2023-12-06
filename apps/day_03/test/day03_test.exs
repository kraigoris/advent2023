defmodule Day03Test do
  use ExUnit.Case

  describe "Day03.part1()" do
    test "should return correct result" do
      assert Day03.part1() === 536_576
    end
  end

  describe "Day03.part2()" do
    test "should return correct result" do
      assert Day03.part2() === 75_741_499
    end
  end

  describe "Day03.neighbours()" do
    test "top left" do
      # 123.
      # ....
      assert Day03.neighbours(cell(at: 0, row: 0), 50) === [
               {3, 0},
               {3, 1},
               {2, 1},
               {1, 1},
               {0, 1}
             ]
    end

    test "top right" do
      # .123
      # ....
      assert Day03.neighbours(cell(at: 47, row: 0), 50) === [
               {49, 1},
               {48, 1},
               {47, 1},
               {46, 1},
               {46, 0}
             ]
    end

    test "bottom left" do
      # ....
      # 123.
      assert Day03.neighbours(cell(at: 0, row: 49), 50) === [
               {0, 48},
               {1, 48},
               {2, 48},
               {3, 48},
               {3, 49}
             ]
    end

    test "bottom right" do
      # ....
      # .123
      assert Day03.neighbours(cell(at: 47, row: 49), 50) === [
               {46, 48},
               {47, 48},
               {48, 48},
               {49, 48},
               {46, 49}
             ]
    end

    test "top edge" do
      # .123.
      # .....

      assert Day03.neighbours(cell(at: 20, row: 0), 50) === [
               {23, 0},
               {23, 1},
               {22, 1},
               {21, 1},
               {20, 1},
               {19, 1},
               {19, 0}
             ]
    end

    test "bottom edge" do
      # .....
      # .123.
      assert Day03.neighbours(cell(at: 20, row: 49), 50) === [
               {19, 48},
               {20, 48},
               {21, 48},
               {22, 48},
               {23, 48},
               {23, 49},
               {19, 49}
             ]
    end

    test "left edge" do
      # ....
      # 123.
      # ....
      assert Day03.neighbours(cell(at: 0, row: 20), 50) === [
               {0, 19},
               {1, 19},
               {2, 19},
               {3, 19},
               {3, 20},
               {3, 21},
               {2, 21},
               {1, 21},
               {0, 21}
             ]
    end

    test "right edge" do
      # ....
      # .123
      # ....
      assert Day03.neighbours(cell(at: 47, row: 20), 50) === [
               {46, 19},
               {47, 19},
               {48, 19},
               {49, 19},
               {49, 21},
               {48, 21},
               {47, 21},
               {46, 21},
               {46, 20}
             ]
    end

    test "middle" do
      # .....
      # .123.
      # .....
      assert Day03.neighbours(cell(at: 20, row: 20), 50) === [
               {19, 19},
               {20, 19},
               {21, 19},
               {22, 19},
               {23, 19},
               {23, 20},
               {23, 21},
               {22, 21},
               {21, 21},
               {20, 21},
               {19, 21},
               {19, 20}
             ]
    end
  end

  def cell(params \\ []) do
    Map.merge(
      %{
        at: 0,
        row: 0,
        length: 3,
        value: 123,
        str: "123",
        row_length: 50
      },
      Map.new(params)
    )
  end
end
