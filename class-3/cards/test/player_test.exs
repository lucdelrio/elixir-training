defmodule PlayerTest do
  use ExUnit.Case
  doctest Player

  test "create_player" do
    player = Player.create_player(:luke, ["Ace of Spades", "Ace of Clubs"])
    assert player[:luke] == ["Ace of Spades", "Ace of Clubs"]
  end

  test "throw_card with sucess" do
    player = Player.create_player(:luke, ["Ace of Spades", "Ace of Clubs"])
    card = Player.throw_card(player, 1)

    assert card == "Ace of Spades"
  end

  test "throw_card expects error with 4 and card count is 2" do
    player = Player.create_player(:luke, ["Ace of Spades", "Ace of Clubs"])

    assert_raise CardException, fn ->
      Player.throw_card(player, 4)
    end
  end

  test "throw_card expects error with 0 and card count is 2" do
    player = Player.create_player(:luke, ["Ace of Spades", "Ace of Clubs"])

    assert_raise CardException, fn ->
      Player.throw_card(player, 0)
    end
  end
end
