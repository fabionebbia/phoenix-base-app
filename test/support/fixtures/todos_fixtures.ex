defmodule App.TodosFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `App.Todos` context.
  """

  @doc """
  Generate a todo.
  """
  def todo_fixture(attrs \\ %{}) do
    {:ok, todo} =
      attrs
      |> Enum.into(%{
        body: "some body",
        title: "some title"
      })
      |> App.Todos.create_todo()

    todo
  end
end
