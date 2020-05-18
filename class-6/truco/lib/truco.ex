defmodule Truco do
  alias Truco.Game
  alias Truco.Player
  alias Truco.Card

  def play(list_players) do
    IO.puts("Welcome to Truco\n")

    Game.create_deck()
    |> Game.shuffle()
    |> Game.deal()
    |> play_hand(list_players)
  end

  def play_hand([%Player{cards: [], score: score_1}, %Player{cards: [], score: score_2}]) do
    cond do
      score_1 > score_2 -> "Player 1 wins"
      score_1 < score_2 -> "Player 2 wins"
      true -> "Tie"
    end
  end

  def play_hand(list_players) do
    list_players
    |> choose
    |> compare
    |> win_or_loose
    |> check
  end

  def choose([%Player{cards: cards_1}, %Player{cards: cards_2}]) do
    IO.puts("Here are yours cards:")

    cards_1
    |> Enum.map(fn %Card{name: name} -> IO.puts(name) end)

    # TODO: We should add the index here
    # TODO: Add name player

    index = IO.gets("\nChoose your card\n(1,2 or 3)\n\nChoosen card: ")

    {card_number_player_1, _} = Integer.parse(index)
  
    if((card_number_player_1 > 0 and card_number_player_1 < 4) or card_number_player_1 == :error) do

      card_player_1 =
        cards_1
        |> Enum.at(card_number_player_1 - 1)

      card_player_2 =
        cards_2
        |> Enum.random()

      [
        %Player{card_selected: card_player_1, cards: cards_1},
        %Player{card_selected: card_player_2, cards: cards_2}
      ]
    else
      raise CardException
    end
  end

  def compare([
        %Player{card_selected: %Card{magic: magic_1}} = player_1,
        %Player{card_selected: %Card{magic: magic_2}} = player_2
      ]) do
    cond do
      magic_1 > magic_2 ->
        {:win, [player_1, player_2]}

      magic_1 < magic_2 ->
        {:loose, [player_1, player_2]}

      true ->
        {:tie, [player_1, player_2]}
    end
  end

  def win_or_loose(
        {status, [%Player{score: score_1} = player_1, %Player{score: score_2} = player_2]}
      ) do
    case status do
      :win ->
        IO.puts("Hand Win !!!!!!")
        [%Player{player_1 | score: score_1 + 1}, player_2]

      :loose ->
        IO.puts("Hand Loose !!!!!!")
        [player_1, %Player{player_2 | score: score_2 + 1}]

      :tie ->
        IO.puts("Hand Tie !!!!!!")
        [player_1, player_2]
    end
  end

  def check([
        %Player{cards: cards_1, card_selected: %Card{name: card_name_1}} = player_1,
        %Player{cards: cards_2, card_selected: %Card{name: card_name_2}} = player_2
      ]) do
    cards_remained_1 =
      cards_1
      |> Enum.filter(fn %Card{name: card_name_filter_1} -> card_name_filter_1 != card_name_1 end)

    cards_remained_2 =
      cards_2
      |> Enum.filter(fn %Card{name: card_name_filter_2} -> card_name_filter_2 != card_name_2 end)

    [
      %Player{player_1 | cards: cards_remained_1, card_selected: nil},
      %Player{player_2 | cards: cards_remained_2, card_selected: nil}
    ]
    # |> test
  end
end
