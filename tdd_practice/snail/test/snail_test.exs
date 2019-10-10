defmodule SnailTest do
  use ExUnit.Case


  describe "Snail.snail/1" do
    test "returns empty list when no data is given" do
      assert Snail.snail([[]]) == []
    end

    test "returns list with one item when there is only one value given" do
      assert Snail.snail([[1]]) == [1]
    end

    test "returns all 'n' when only 'n's are given" do
      assert Snail.snail([[0, 0],
                          [0, 0]]) == [0, 0, 0, 0]
    end

    test "properly returns snailed 2x2 matrix" do
      assert Snail.snail([[1, 2],
                          [3, 4]]) == [1, 2, 4, 3]
    end

    test "properly returns snailed 3x3 matrix" do
      assert Snail.snail([[1, 2, 3],
                          [4, 5, 6],
                          [7, 8, 9]]) == [1, 2, 3, 6, 9, 8, 7, 4, 5]
    end

    test "properly returns snailed 4x4 matrix" do
      assert Snail.snail([[1, 2, 3, 4],
                          [5, 6, 7, 8],
                          [9, 10, 11, 12],
                          [13, 14, 15, 16]]) == [1, 2, 3, 4, 8, 12, 16, 15, 14, 13, 9, 5, 6, 7, 11, 10]
    end
  end

  describe "Snail.right/1" do
    test "returns empty lists when no data is given" do
      assert Snail.right([[]]) == {[], [[]]}
    end

    test "returns {[num], [[]]} when there is only one value given" do
      assert Snail.right([[1]]) == {[1], [[]]}
    end

    test "returns head and tail of given list" do
      assert Snail.right([[1, 2, 3], [4, 5, 6], [7, 8, 9]]) == {[1, 2, 3], [[4, 5, 6], [7, 8, 9]]}
    end
  end

  describe "Snail.down/1" do
    test "returns empty lists when no data is given" do
      assert Snail.down([[]]) == {[], [[]]}
    end

    test "returns {[num], [[]]} when there is only one value given" do
      assert Snail.down([[1]]) == {[1], [[]]}
    end

    test "returns the last values of a given list of lists" do
      assert Snail.down([[1, 2, 3], [4, 5, 6], [7, 8, 9]]) == {[3, 6, 9], [[1, 2], [4, 5], [7, 8]]}
    end
  end

  describe "Snail.left/1" do
    test "returns empty lists when no data is given" do
      assert Snail.left([[]]) == {[], [[]]}
    end

    test "returns {[num], [[]]} when only one value is given" do
      assert Snail.left([[1]]) == {[1], [[]]}
    end

    test "returns the reversed last list of a given list of lists" do
      assert Snail.left([[1, 2, 3], [4, 5, 6], [7, 8, 9]]) == {[9, 8, 7], [[1, 2, 3], [4, 5, 6]]}
    end
  end

  describe "Snail.up/1" do
    test "returns empty lists when no data is given" do
      assert Snail.up([[]]) == {[], [[]]}
    end

    test "returns {[num], [[]]} when only one value is given" do
      assert Snail.up([[1]]) == {[1], [[]]}
    end

    test "returns the first values of a given list of lists" do
      assert Snail.up([[1, 2, 3], [4, 5, 6], [7, 8, 9]]) == {[7, 4, 1], [[2, 3], [5, 6], [8, 9]]}
    end
  end
end
