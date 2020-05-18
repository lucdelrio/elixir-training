defmodule TodoApiWeb.TaskController do
  use TodoApiWeb, :controller

  alias TodoApi.Tasks
  alias TodoApi.Tasks.Task

  def index(conn, _params) do
    tasks = Tasks.list_tasks()

    conn
    |> render(conn, "index.json", tasks: tasks)
  end

  def create(conn, %{"tasks" => task_params}) do
    with {:ok, %Task{} = task} <- Tasks.create_tasks(task_params) do
      conn
      |> put_status(:created)
      |> render("show.json", task: task)
    end
  end

  def show(conn, %{"id" => id}) do
    with {:ok, task} <- Tasks.get_tasks(id) do
      conn
      |> send_resp("show.json", task: task)
    end
  end

  def update(conn, %{"id" => id, "tasks" => tasks_params}) do
    with {:ok, tasks} <- Tasks.get_tasks!(id),
         {:ok, tasks} <- Tasks.update_tasks(tasks, tasks_params) do
      conn
      |> send_resp("show.json", tasks: tasks)
    end
  end

  def delete(conn, %{"id" => id}) do
    tasks = Tasks.get_tasks!(id)

    with {:ok, task} <- Tasks.delete_tasks(tasks) do
      send_resp(conn, :no_content, "")
    end
  end
end
