defmodule Identicon do
  @moduledoc """
    Documentation for `Identicon`
  """

  @doc """
  Returns a binary for the Identicon by name

  ## Examples
      iex> Identicon.main("Lucas")
  """
  def main(input) do
    input
      |> hash_input
      |> pick_color
      |> build_grid
      |> filter_odd_squares
      |> build_pixel_map
      |> draw_image
  end

  @doc """
  Saves an image file with png extension

  ## Examples
      iex> binary = Identicon.main("Lucas")
      iex> Identicon.save_image(binary, "Lucas")
  """
  def save_image(image, input) do
    File.write("#{input}.png", image)
  end

  defp hash_input(input) do
    hex = :crypto.hash(:md5, input)
          |> :binary.bin_to_list
    %Identicon.Image{hex: hex}
  end

  defp pick_color(%Identicon.Image{hex: [ r, g, b | _tail]} = image) do
    %Identicon.Image{ image | color: {r, g, b}}
  end

  defp build_grid(%Identicon.Image{ hex: hex }=image) do
    grid =
      hex
      |> Enum.chunk_every(3)
      |> Enum.drop(-1)
      |> Enum.map(&mirror_row/1)
      |> Enum.concat
      |> Enum.with_index
    %Identicon.Image{ image | grid: grid}
  end


  defp mirror_row([first, second | _tail] = row) do
    row ++ [second, first]
  end

  defp filter_odd_squares(%Identicon.Image{grid: grid} = image) do
    grid = Enum.filter grid, fn { code, _index } ->
      rem(code, 2) == 0
    end

    %Identicon.Image{ image | grid: grid }
  end

  defp build_pixel_map(%Identicon.Image{grid: grid} = image) do
    pixel_map = Enum.map grid, fn({ _code, index }) ->
      horizontal = rem(index, 5) * 50
      vertical = div(index, 5) * 50
      top_left = { horizontal, vertical }
      bottom_right = { horizontal + 50, vertical + 50}
      { top_left, bottom_right }
    end

    %Identicon.Image{ image | pixel_map: pixel_map }
  end

  defp draw_image(%Identicon.Image{ color: color, pixel_map: pixel_map}) do
    image = :egd.create(250, 250)
    fill = :egd.color(color)
    Enum.each pixel_map, fn({ start, stop }) ->
      :egd.filledRectangle(image, start, stop, fill)
    end

    :egd.render(image)
  end
end
