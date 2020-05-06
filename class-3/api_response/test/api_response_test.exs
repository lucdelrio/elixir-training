defmodule ApiResponseTest do
  use ExUnit.Case
  doctest ApiResponse

  describe "handle_response_with_if_else" do
    test "returns 'Ok'" do
      assert ApiResponse.handle_response_1_with_if_else({:ok, %{city: 'Buenos Aires'}}) == "Ok"
    end

    test "returns 'Error'" do
      assert ApiResponse.handle_response_1_with_if_else({:error, %{country: 'Argentina'}}) ==
               "Error"
    end

    test "returns :no_match_message_error" do
      assert ApiResponse.handle_response_1_with_if_else({:what, %{sport: 'Fútbol'}}) ==
               :no_match_message_error
    end
  end

  describe "handle_response_with_cond" do
    test "returns 'Ok'" do
      assert ApiResponse.handle_response_1_with_cond({:ok, %{city: 'Buenos Aires'}}) == "Ok"
    end

    test "returns 'Error'" do
      assert ApiResponse.handle_response_1_with_cond({:error, %{country: 'Argentina'}}) == "Error"
    end

    test "returns :no_match_message_error" do
      assert ApiResponse.handle_response_1_with_cond({:what, %{sport: 'Fútbol'}}) ==
               :no_match_message_error
    end
  end

  describe "handle_response_with_case" do
    test "returns 'Ok'" do
      assert ApiResponse.handle_response_1_with_cond({:ok, %{city: 'Buenos Aires'}}) == "Ok"
    end

    test "returns 'Error'" do
      assert ApiResponse.handle_response_1_with_cond({:error, %{country: 'Argentina'}}) == "Error"
    end

    test "returns :no_match_message_error" do
      assert ApiResponse.handle_response_1_with_cond({:what, %{sport: 'Fútbol'}}) ==
               :no_match_message_error
    end
  end

  describe "handle_response_with_functions" do
    test "returns 'Ok'" do
      assert ApiResponse.handle_response_1_with_functions({:ok, %{city: 'Buenos Aires'}}) == "Ok"
    end

    test "returns 'Error'" do
      assert ApiResponse.handle_response_1_with_functions({:error, %{country: 'Argentina'}}) ==
               "Error"
    end

    test "returns :no_match_message_error" do
      assert ApiResponse.handle_response_1_with_functions({:what, %{sport: 'Fútbol'}}) ==
               :no_match_message_error
    end
  end
end
