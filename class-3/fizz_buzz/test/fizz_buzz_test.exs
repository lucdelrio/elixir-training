defmodule FizzBuzzTest do
  use ExUnit.Case
  doctest FizzBuzz

  describe "fuzzle_with_cond" do
    test "returns third arg when there is not any zero args" do
      assert FizzBuzz.fuzzle_with_cond(2,1,4) == 4
    end

    test "returns 'FizzBuzz' when the first two are zero" do
      assert FizzBuzz.fuzzle_with_cond(0,0,4) == "FizzBuzz"
    end

    test "returns 'Fizz'" do
      assert FizzBuzz.fuzzle_with_cond(0,1,4) == "Fizz"
    end

    test "returns 'Buzz'" do
      assert FizzBuzz.fuzzle_with_cond(2,0,4) == "Buzz"
    end
  end

  describe "fuzzle_with_case" do
    test "returns third arg when there is not any zero args" do
      assert FizzBuzz.fuzzle_with_case(2,1,4) == 4
    end

    test "returns 'FizzBuzz' when the first two are zero" do
      assert FizzBuzz.fuzzle_with_case(0,0,4) == "FizzBuzz"
    end

    test "returns 'Fizz'" do
      assert FizzBuzz.fuzzle_with_case(0,1,4) == "Fizz"
    end

    test "returns 'Buzz'" do
      assert FizzBuzz.fuzzle_with_case(2,0,4) == "Buzz"
    end
  end
end
