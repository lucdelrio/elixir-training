defmodule TodoApiWeb.TaskController do
  use TodoApiWeb, :controller

  alias TodoApi.Tasks
  alias TodoApi.Tasks.Task

  def index(conn, _params) do
    tasks = Tasks.list_tasks()
    render(conn, "index.json", tasks: tasks)
  end

  def create(conn, %{"tasks" => task_params}) do
    with {:ok, %Task{} = tasks} <- Tasks.create_tasks(task_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", Routes.task_path(conn, :show, tasks))
      |> render("show.json", tasks: tasks)
    end
  end

  def show(conn, %{"id" => id}) do
    tasks = Tasks.get_tasks!(id)
    render(conn, "show.json", tasks: tasks)
  end

  def update(conn, %{"id" => id, "tasks" => tasks_params}) do
    tasks = Tasks.get_tasks!(id)

    with {:ok, %Task{} = tasks} <- Tasks.update_tasks(tasks, tasks_params) do
      render(conn, "show.json", tasks: tasks)
    end
  end

  def delete(conn, %{"id" => id}) do
    tasks = Tasks.get_tasks!(id)

    with {:ok, %Task{}} <- Tasks.delete_tasks(tasks) do
      send_resp(conn, :no_content, "")
    end
  end
end
