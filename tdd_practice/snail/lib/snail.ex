defmodule Snail do
  def snail(matrix), do: snail([], matrix)
  def snail(aggregate, [[]]), do: aggregate
  def snail(aggregate, matrix) do
    {res, rem} = right(matrix)
    aggregate = aggregate ++ res

    {res, rem} = down(rem)
    aggregate = aggregate ++ res

    {res, rem} = left(rem)
    aggregate = aggregate ++ res

    {res, rem} = up(rem)
    aggregate = aggregate ++ res

    snail(aggregate, rem)
  end

  def right([[]]), do: {[], [[]]}
  def right([[num]]), do: {[num], [[]]}
  def right(matrix) do
    [result | remainder] = matrix
    {result, remainder}
  end

  def down([[]]), do: {[], [[]]}
  def down(matrix) do
    result = matrix |> Enum.map(&List.last/1)
    remainder = matrix |> Enum.map(&Enum.drop(&1, -1))
    {result, remainder}
  end

  def left([[]]), do: {[], [[]]}
  def left([[num]]), do: {[num], [[]]}
  def left(matrix) do
    result = matrix |> List.last() |> Enum.reverse()
    remainder = matrix |> Enum.drop(-1)
    {result, remainder}
  end

  def up([[]]), do: {[], [[]]}
  def up(matrix) do
    result = matrix |> Enum.reverse() |> Enum.map(&List.first/1)
    remainder = matrix |> Enum.map(&Enum.drop(&1, 1))
    {result, remainder}
  end
end
