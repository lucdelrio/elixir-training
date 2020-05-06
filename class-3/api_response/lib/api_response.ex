defmodule ApiResponse do
  @moduledoc """
  Documentation for `ApiResponse`.
  """

  @ok_message "Ok"
  @error_message "Error"

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
      @ok_message
    else
      if status == :error do
        @error_message
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
      status == :ok -> @ok_message
      status == :error -> @error_message
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
      :ok -> @ok_message
      :error -> @error_message
      _ -> :no_match_message_error
    end
  end

  @doc """
  Implemented with the Control Structure "With"

  ## Examples

      iex> ApiResponse.handle_response_1_control_structure_with({:ok, %{movie: 'Gladiator'}})
      "Ok"

      iex> ApiResponse.handle_response_1_control_structure_with({:error, %{app: 'Iterm'}})
      "Error"

      iex> ApiResponse.handle_response_1_control_structure_with({:what, %{food: 'Burger'}})
      :no_match_message_error

  """
  def handle_response_1_control_structure_with({status, %{}}) do
    with response <- status_response(status) do
      response
    end
  end

  @doc """
  Implemented with Functions

  ## Examples

      iex> ApiResponse.handle_response_1_with_functions({:ok, %{movie: 'Gladiator'}})
      "Ok"

      iex> ApiResponse.handle_response_1_with_functions({:error, %{app: 'Iterm'}})
      "Error"

      iex> ApiResponse.handle_response_1_with_functions({:what, %{food: 'Burger'}})
      :no_match_message_error

  """
  def handle_response_1_with_functions({:ok, _}), do: @ok_message
  def handle_response_1_with_functions({:error, _}), do: @error_message
  def handle_response_1_with_functions(_), do: :no_match_message_error

  defp status_response(status) do
    case status do
      :ok -> @ok_message
      :error -> @error_message
      _ -> :no_match_message_error
    end
  end
end
