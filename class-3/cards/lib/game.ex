defmodule Game do
  @moduledoc """
    Provides methods for creating and handling a cards Game
  """

  @doc """
    Creates a game, setting a winner card.

  ## Examples

    iex> Game.create_game("Ace of Clubs")
    "Ace of Clubs"
  """
  def create_game(winner_card) do
    winner_card
  end

  @doc """
    Returns one card from a player hand

  ## Examples
    iex> game = Game.create_game("Ace of Clubs")
    iex> player = Player.create_player("Player1", ["Ace of Spades", "Ace of Clubs"])
    iex> player1_card = Player.throw_card(player, 2)
    iex> Game.check_card_winner(game, player1_card, player)
    "Player1 wins"
  """
  def check_card_winner(game, player_card, player) do
    if game == player_card do
      player_name = Map.keys(player)
      "#{player_name} wins"
    else
      "Continue trying"
    end
  end
end
