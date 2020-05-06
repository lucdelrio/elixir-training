defmodule ApiResponse do
  @moduledoc """
  Documentation for `ApiResponse`.
  """

  @doc """
  Implemented with the Control Structure "If/else"

  ## Examples

      iex> ApiResponse.handle_response_1_with_if_else({:ok, %{movie: 'Gladiator'}})
      "Ok"

      iex> ApiResponse.handle_response_1_with_if_else({:error, %{app: 'Iterm'}})
      "Error"

      iex> ApiResponse.handle_response_1_with_if_else({:what, %{food: 'Burger'}})
      :no_match_message_error

  """
  def handle_response_1_with_if_else({status, %{}}) do
    if status == :ok do
      "Ok"
    else
      if status == :error do
        "Error"
      else
        :no_match_message_error
      end
    end
  end

  @doc """
  Implemented with the Control Structure "Cond"

  ## Examples

      iex> ApiResponse.handle_response_1_with_cond({:ok, %{movie: 'Gladiator'}})
      "Ok"

      iex> ApiResponse.handle_response_1_with_cond({:error, %{app: 'Iterm'}})
      "Error"

      iex> ApiResponse.handle_response_1_with_cond({:what, %{food: 'Burger'}})
      :no_match_message_error

  """
  def handle_response_1_with_cond({status, %{}}) do
    cond do
      status == :ok -> "Ok"
      status == :error -> "Error"
      true -> :no_match_message_error
    end
  end

  @doc """
  Implemented with the Control Structure "Case"

  ## Examples

      iex> ApiResponse.handle_response_1_with_case({:ok, %{movie: 'Gladiator'}})
      "Ok"

      iex> ApiResponse.handle_response_1_with_case({:error, %{app: 'Iterm'}})
      "Error"

      iex> ApiResponse.handle_response_1_with_case({:what, %{food: 'Burger'}})
      :no_match_message_error

  """
  def handle_response_1_with_case({status, %{}}) do
    case status do
      :ok -> "Ok"
      :error -> "Error"
      _ -> :no_match_message_error
    end
  end

  @doc """
  Implemented with "Functions" (with)

  ## Examples

      iex> ApiResponse.handle_response_1_with_functions({:ok, %{movie: 'Gladiator'}})
      "Ok"

      iex> ApiResponse.handle_response_1_with_functions({:error, %{app: 'Iterm'}})
      "Error"

      iex> ApiResponse.handle_response_1_with_functions({:what, %{food: 'Burger'}})
      :no_match_message_error

  """
  def handle_response_1_with_functions({status, %{}}) do
    with response <- status_response(status) do
      response
    end
  end

  defp status_response(status) do
    case status do
      :ok -> "Ok"
      :error -> "Error"
      _ -> :no_match_message_error
    end
  end
end
