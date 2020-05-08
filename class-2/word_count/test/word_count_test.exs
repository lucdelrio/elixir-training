defmodule WordCountTest do
  use ExUnit.Case
  doctest WordCount

  test "return success when there is 2 'world in the phrase" do
    assert WordCount.count_occurrences("Hello to all the world world") == %{"hello" => 1, "to" => 1, "all" => 1, "the" => 1, "world" => 2}
  end

  test "return success when there is a number and more than one ocurrencies" do
    assert WordCount.count_occurrences("Elixir rocks my world 10 10 for ever and ever. Love elixir") == 
    %{"elixir" => 2, "rocks" => 1, "my" => 1, "world" => 1, "10" => 2, "for" => 1, "ever" => 2, "and" => 1, "love" => 1}
  end
end
