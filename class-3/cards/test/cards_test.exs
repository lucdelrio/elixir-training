defmodule CardsTest do
  use ExUnit.Case
  doctest Cards

  test "create_deck make 20 cards" do
    deck_length = length(Cards.create_deck())
    assert deck_length == 20
  end

  test "shuffle the deck" do
    deck = Cards.create_deck()
    refute deck == Cards.shuffle(deck)
  end

  test "extra shuffle test" do
    deck = Cards.create_deck()
    deck2 = Cards.shuffle(deck)
    refute deck2 == Cards.shuffle(deck2)
  end

  test "use the contains function" do
    random_deck =
      Cards.create_deck()
      |> Cards.shuffle()

    [first | _] = random_deck
    contains = Cards.contains?(random_deck, first)
    assert contains == true
  end

  test "take a hand" do
    random_deck =
      Cards.create_deck()
      |> Cards.shuffle()

    {hand, _} = Cards.deal(random_deck, 5)
    hand_length = length(hand)
    assert hand_length == 5
  end
end
