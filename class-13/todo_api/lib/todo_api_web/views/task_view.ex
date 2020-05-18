defmodule TodoApiWeb.TaskView do
  use TodoApiWeb, :view
  alias TodoApiWeb.TaskView

  def render("index.json", %{task: task}) do
    %{data: render_many(task, TaskView, "task.json")}
  end

  def render("show.json", %{tasks: tasks}) do
    %{data: render_one(task, TaskView, "task.json")}
  end

  def render("indalid.json", %{errors: errors}) do
    %{msg: render_many(errors, TaskView, "invalid_schema.json")}
  end

  def render("invalid_schema.json", {key , [msg, _] }) do
    %{key: key, msg: msg}
  end

  def render("task.json", %{task: task}) do
    %{id: task.id,
      name: task.name,
      description: task.description,
      date: task.date}
  end
end
