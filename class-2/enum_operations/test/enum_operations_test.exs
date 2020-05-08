defmodule EnumOperationsTest do
  use ExUnit.Case
  doctest EnumOperations

  test "count elements in numbers list" do
    assert EnumOperations.count([2,3,1,6,5]) == 5
  end

  test "count elements in strings list" do
    assert EnumOperations.count(["Ferrari", "Lotus", "Audi"]) == 3
  end

  test "reverse elements in numbers list" do
    assert EnumOperations.reverse([10, 20, 30]) == [30, 20, 10]
  end

  test "reverse elements in strings list" do
    assert EnumOperations.reverse(["Ferrari", "Lotus", "Audi"]) == ["Audi", "Lotus", "Ferrari"]
  end

  test "filter elements list by condition" do
    assert EnumOperations.filter([11, 3, 12, 7], fn x -> rem(x, 3) == 0 end) == [3,12]
  end

  test "concats two elements" do
    assert EnumOperations.concat(['a'], [4, 5]) == ['a',4, 5]
  end
end
