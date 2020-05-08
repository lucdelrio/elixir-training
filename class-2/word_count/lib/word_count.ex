defmodule WordCount do
  @moduledoc """
  Documentation for `WordCount`.
  """

  @doc """
  Given a phrase, counts the occurrences of each word in that phrase

  ## Examples

      iex> WordCount.count_occurrences("Hello to all the world world")
      %{"hello" => 1, "to" => 1, "all" => 1, "the" => 1, "world" => 2}

  """
  def count_occurrences(phrase) do
    phrase
    |> remove_points
    |> downcase_and_split
    |> count_words
  end

  defp remove_points(phrase) do
    phrase |> String.replace(".", "")
  end

  defp downcase_and_split(phrase) do
    phrase |> String.downcase |> String.split(" ")
  end

  defp count_words(word_list) do
    increment = fn(word, map) ->
      Map.put(map, word, (map[word] || 0) + 1)
    end

    word_list |> Enum.reduce(%{}, increment)
  end
end
