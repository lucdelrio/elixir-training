defmodule EnumOperations do
  @moduledoc """
  Documentation for `EnumOperations`.
  """

  @doc """
  Returns the count of elements in the `enumerable`

  ## Examples

      iex> EnumOperations.count([2,3,1,6,5])
      5

      iex> EnumOperations.count(["car","window","ruby","python"])
      4
  """
  def count(elements) do
    length(elements)
  end

  @doc """
  Returns the reverse order of elements in the `enumerable`

  ## Examples

      iex> EnumOperations.reverse([2,3,1,6,5])
      [5,6,1,3,2]

      iex> EnumOperations.reverse(["car","window","ruby","python"])
      ["python", "ruby", "window", "car"]
  """
  def reverse(elements) do
    :lists.reverse(elements)
  end

  @doc """
  Returns only those elements for which fun function a truthy value.

  ## Examples

      iex> EnumOperations.filter([10, 3, 5, 2], fn x -> rem(x, 2) == 0 end)
      [10, 2]
  """
  def filter(elements, function) do
    filter_list(elements, function)
  end

  @doc """
  Concatenation
  Concatenates the enumerable on the right with the enumerable on the left.

  ## Examples

      iex> EnumOperations.concat([10, 3] ,[5, 2])
      [10, 3, 5, 2]
  """
  def concat(left, right) do
    left ++ right
  end

  defp filter_list([head | tail], fun) do
    if fun.(head) do
      [head | filter_list(tail, fun)]
    else
      filter_list(tail, fun)
    end
  end

  defp filter_list([], _fun) do
    []
  end
end