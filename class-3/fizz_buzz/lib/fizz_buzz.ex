defmodule FizzBuzz do
  @moduledoc """
  Documentation for `FizzBuzz`.
  """

  @doc """
  Implemented with the Control Structure "Cond"

  Taking three arguments.
  If the first two are zero, return “FizzBuzz”.
  If the first is zero, return “Fizz”.
  If the second is zero return “Buzz”.
  Otherwise return the third argument

  ## Examples

      iex> FizzBuzz.fuzzle_with_cond(0, 0, 10)
      "FizzBuzz"

      iex> FizzBuzz.fuzzle_with_cond(0, 4, 10)
      "Fizz"

      iex> FizzBuzz.fuzzle_with_cond(4, 0, 10)
      "Buzz"

      iex> FizzBuzz.fuzzle_with_cond(8, 35, 10)
      10
  """
  def fuzzle_with_cond(first_arg, second_arg, third_arg) do
    cond do
      first_arg == 0 and second_arg == 0 -> "FizzBuzz"
      first_arg == 0 and second_arg != 0 -> "Fizz"
      first_arg != 0 and second_arg == 0 -> "Buzz"
      first_arg != 0 and second_arg != 0 -> third_arg
    end
  end

  @doc """
  Implemented with the Control Structure "Case"

  Taking three arguments.
  If the first two are zero, return “FizzBuzz”.
  If the first is zero, return “Fizz”.
  If the second is zero return “Buzz”.
  Otherwise return the third argument

  ## Examples

      iex> FizzBuzz.fuzzle_with_case(0, 0, 10)
      "FizzBuzz"

      iex> FizzBuzz.fuzzle_with_case(0, 4, 10)
      "Fizz"

      iex> FizzBuzz.fuzzle_with_case(4, 0, 10)
      "Buzz"

      iex> FizzBuzz.fuzzle_with_case(8, 35, 10)
      10
  """
  def fuzzle_with_case(first_arg, second_arg, third_arg) do
    case {first_arg, second_arg, third_arg} do
      {0, 0, _third_arg} -> "FizzBuzz"
      {0, _second_arg, _third_arg} -> "Fizz"
      {_first_arg, 0, _third_arg} -> "Buzz"
      {_first_arg, _second_arg, _third_arg} -> third_arg
    end
  end
end
