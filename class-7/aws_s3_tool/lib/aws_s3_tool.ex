defmodule AwsS3Tool do
  @moduledoc """
  Documentation for `AwsS3Tool`.
  """

  @doc """
  Uploads any file to an Aws S3 Bucket.

  ## Examples
      iex> AwsS3Tool.upload("Users/owner/Documents/file_to_upload")
  """
  def upload(file_path) do
    with binary <- read_file(file_path) do
         s3_upload(binary, file_path)
    end
  end

  ## Reads the selected file.

  defp read_file(file_path), do: File.read!(file_path)

  ## Uploads a binary to a hardcoded Aws S3 Bucket.

  defp s3_upload(binary, file_path) do
    file_name = Path.basename(file_path)

    %{status_code: status} =
      ExAws.S3.put_object("elixir-trainings", "lucas-delrio/#{file_name}", binary)
      |> ExAws.request!()

    case status do
      200 -> :ok
      _ -> :error
    end
  end
end
