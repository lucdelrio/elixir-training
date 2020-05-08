defmodule Player do
  @moduledoc """
    Provides methods for creating and handling a player in the cards game
  """

  @doc """
    Returns a player with a hand of cards

  ## Examples

    iex> Player.create_player(:player1, ["Ace of Spades", "Ace of Clubs"])
    %{player1: ["Ace of Spades", "Ace of Clubs"]}
  """
  def create_player(name, hand) do
    %{name => hand}
  end

  @doc """
    Returns one card from a player hand

  ## Examples

    iex> player = Player.create_player(:player1, ["Ace of Spades", "Ace of Clubs"])
    iex> Player.throw_card(player, 2)
    "Ace of Clubs"
  """
  def throw_card(player, selected_card) do
    values = Map.values(player)
    [cards | _trash] = values

    if selected_card <= length(cards) and selected_card > 0 do
      Enum.at(cards, selected_card - 1)
    else
      raise CardException
    end
  end
end
