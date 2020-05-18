defmodule TodoApi.TaskTest do
  use TodoApi.DataCase

  alias TodoApi.Tasks

  describe "tasks" do
    alias TodoApi.Tasks.Task

    @valid_attrs %{date: ~D[2010-04-17], description: "some description", name: "some name"}
    @update_attrs %{date: ~D[2011-05-18], description: "some updated description", name: "some updated name"}
    @invalid_attrs %{date: nil, description: nil, name: nil}

    def tasks_fixture(attrs \\ %{}) do
      {:ok, tasks} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Task.create_tasks()

      tasks
    end

    test "list_tasks/0 returns all tasks" do
      tasks = tasks_fixture()
      assert Task.list_tasks() == [tasks]
    end

    test "get_tasks!/1 returns the tasks with given id" do
      tasks = tasks_fixture()
      assert Task.get_tasks!(tasks.id) == tasks
    end

    test "create_tasks/1 with valid data creates a tasks" do
      assert {:ok, %Task{} = tasks} = Task.create_tasks(@valid_attrs)
      assert tasks.date == ~D[2010-04-17]
      assert tasks.description == "some description"
      assert tasks.name == "some name"
    end

    test "create_tasks/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Task.create_tasks(@invalid_attrs)
    end

    test "update_tasks/2 with valid data updates the tasks" do
      tasks = tasks_fixture()
      assert {:ok, %Task{} = tasks} = Task.update_tasks(tasks, @update_attrs)
      assert tasks.date == ~D[2011-05-18]
      assert tasks.description == "some updated description"
      assert tasks.name == "some updated name"
    end

    test "update_tasks/2 with invalid data returns error changeset" do
      tasks = tasks_fixture()
      assert {:error, %Ecto.Changeset{}} = Task.update_tasks(tasks, @invalid_attrs)
      assert tasks == Task.get_tasks!(tasks.id)
    end

    test "delete_tasks/1 deletes the tasks" do
      tasks = tasks_fixture()
      assert {:ok, %Task{}} = Task.delete_tasks(tasks)
      assert_raise Ecto.NoResultsError, fn -> Task.get_tasks!(tasks.id) end
    end

    test "change_tasks/1 returns a tasks changeset" do
      tasks = tasks_fixture()
      assert %Ecto.Changeset{} = Task.change_tasks(tasks)
    end
  end
end
