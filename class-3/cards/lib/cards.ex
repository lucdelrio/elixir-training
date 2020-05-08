defmodule Cards do
  @moduledoc """
    Provides methods for creating and handling a deck of cards
  """

  @doc """
    Returns a list of strings representing a deck of playing cards

  ## Examples
    iex> Cards.create_deck
    ["Ace of Spades", "Ace of Clubs", "Ace of Hearts", "Ace of Diamonds",
    "Two of Spades", "Two of Clubs", "Two of Hearts", "Two of Diamonds",
    "Three of Spades", "Three of Clubs", "Three of Hearts", "Three of Diamonds",
    "Four of Spades", "Four of Clubs", "Four of Hearts", "Four of Diamonds",
    "Five of Spades", "Five of Clubs", "Five of Hearts", "Five of Diamonds"]
  """
  def create_deck do
    values = ["Ace", "Two", "Three", "Four", "Five"]
    suits = ["Spades", "Clubs", "Hearts", "Diamonds"]

    for value <- values, suit <- suits do
      "#{value} of #{suit}"
    end
  end

  @doc """
    Returns a list of strings representing a deck of random cards
  """
  def shuffle(deck) do
    Enum.shuffle(deck)
  end

  @doc """
    Determines whether a deck contains a given card
  """
  def contains?(deck, card) do
    Enum.member?(deck, card)
  end

  @doc """
    Divides a deck into a hand and the reminder of the deck.

    ## Examples
      iex> deck = Cards.create_deck
      iex> {hand, deck} = Cards.deal(deck, 2)
      iex> hand
      ["Ace of Spades", "Ace of Clubs"]
  """
  def deal(deck, hand_size) do
    Enum.split(deck, hand_size)
  end

  @doc """
    Returns a new hand from the random deck created
  """
  def create_hand(hand_size) do
    Cards.create_deck()
    |> Cards.shuffle()
    |> Cards.deal(hand_size)
  end

  @doc """
    Saves program progress into a file
  """
  def save(deck, filename) do
    binary = :erlang.term_to_binary(deck)
    File.write(filename, binary)
  end

  @doc """
    Loads program progress from a file
  """
  def load(filename) do
    case File.read(filename) do
      {:ok, binary} -> :erlang.binary_to_term(binary)
      {:error, _reason} -> "That file doesn't exists"
    end
  end
end
