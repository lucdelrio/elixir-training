defmodule TodoApi.Tasks.Task do
  use Ecto.Schema
  import Ecto.Changeset

  schema "tasks" do
    field :date, :date
    field :description, :string
    field :name, :string

    timestamps()
  end

  @doc false
  def changeset(tasks, attrs) do
    tasks
    |> cast(attrs, [:name, :description, :date])
    |> validate_required([:name, :date])
  end
end
