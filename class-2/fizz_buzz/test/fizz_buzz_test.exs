defmodule FizzBuzzTest do
  use ExUnit.Case
  doctest FizzBuzz

  test "returns third arg when there is not any zero args" do
    assert FizzBuzz.fuzzle(2,1,4) == 4
  end

  test "returns 'FizzBuzz' when the first two are zero" do
    assert FizzBuzz.fuzzle(0,0,4) == "FizzBuzz"
  end

  test "returns 'Fizz'" do
    assert FizzBuzz.fuzzle(0,1,4) == "Fizz"
  end

  test "returns 'Buzz'" do
    assert FizzBuzz.fuzzle(2,0,4) == "Buzz"
  end
end
