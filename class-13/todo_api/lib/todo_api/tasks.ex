defmodule TodoApi.Tasks do
  @moduledoc """
  The Tasks context.
  """

  import Ecto.Query, warn: false
  alias TodoApi.Repo

  alias TodoApi.Tasks.Task

  @doc """
  Returns the list of tasks.

  ## Examples

      iex> list_tasks()
      [%Task{}, ...]

  """
  def list_tasks do
    Repo.all(Task)
  end

  @doc """
  Gets a single tasks.

  Raises `Ecto.NoResultsError` if the Tasks does not exist.

  ## Examples

      iex> get_tasks!(123)
      %Task{}

      iex> get_tasks!(456)
      ** (Ecto.NoResultsError)

  """
  def get_tasks!(id), do: Repo.get!(Task, id)

  def get(id) do
    Task
    |> Repo.get!(id)
  end

  @doc """
  Creates a tasks.

  ## Examples

      iex> create_tasks(%{field: value})
      {:ok, %Task{}}

      iex> create_tasks(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_tasks(attrs \\ %{}) do
    %Task{}
    |> Task.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a tasks.

  ## Examples

      iex> update_tasks(tasks, %{field: new_value})
      {:ok, %Task{}}

      iex> update_tasks(tasks, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_tasks(%Task{} = tasks, attrs) do
    tasks
    |> Task.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a tasks.

  ## Examples

      iex> delete_tasks(tasks)
      {:ok, %Task{}}

      iex> delete_tasks(tasks)
      {:error, %Ecto.Changeset{}}

  """
  def delete_tasks(%Task{} = tasks) do
    # tasks
    # |> Repo.delete()
    Repo.delete(tasks)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking tasks changes.

  ## Examples

      iex> change_tasks(tasks)
      %Ecto.Changeset{data: %Task{}}

  """
  def change_tasks(%Task{} = tasks, attrs \\ %{}) do
    Task.changeset(tasks, attrs)
  end
end
