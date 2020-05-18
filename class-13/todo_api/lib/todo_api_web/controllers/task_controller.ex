defmodule TodoApiWeb.TaskController do
  use TodoApiWeb, :controller

  alias TodoApi.Tasks
  alias TodoApi.Tasks.Task

  action_fallback TodoApiWeb.FallbackController

  def index(conn, _params) do
    tasks = Task.list_tasks()
    render(conn, "index.json", tasks: tasks)
  end

  def create(conn, %{"task" => task_params}) do
    with {:ok, %Task{} = tasks} <- Task.create_tasks(task_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", Routes.tasks_path(conn, :show, tasks))
      |> render("show.json", tasks: tasks)
    end
  end

  def show(conn, %{"id" => id}) do
    tasks = Task.get_tasks!(id)
    render(conn, "show.json", tasks: tasks)
  end

  def update(conn, %{"id" => id, "tasks" => tasks_params}) do
    tasks = Task.get_tasks!(id)

    with {:ok, %Task{} = tasks} <- Task.update_tasks(tasks, tasks_params) do
      render(conn, "show.json", tasks: tasks)
    end
  end

  def delete(conn, %{"id" => id}) do
    tasks = Task.get_tasks!(id)

    with {:ok, %Task{}} <- Task.delete_tasks(tasks) do
      send_resp(conn, :no_content, "")
    end
end
