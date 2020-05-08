defmodule FizzBuzz do
  @moduledoc """
  Documentation for `FizzBuzz`.
  """

  @doc """
  Taking three arguments.
  If the first two are zero, return “FizzBuzz”.
  If the first is zero, return “Fizz”.
  If the second is zero return “Buzz”.
  Otherwise return the third argument

  ## Examples

      iex> FizzBuzz.fuzzle(0, 0, 10)
      "FizzBuzz"

      iex> FizzBuzz.fuzzle(0, 4, 10)
      "Fizz"

      iex> FizzBuzz.fuzzle(4, 0, 10)
      "Buzz"

      iex> FizzBuzz.fuzzle(8, 35, 10)
      10
  """
  def fuzzle(first_arg, second_arg, third_arg) do
    cond do
      first_arg == 0 and second_arg == 0 -> "FizzBuzz"
      first_arg == 0 and second_arg != 0 -> "Fizz"
      first_arg != 0 and second_arg == 0 -> "Buzz"
      first_arg != 0 and second_arg != 0 -> third_arg
    end
  end
end
