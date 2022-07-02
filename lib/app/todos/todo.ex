defmodule App.Todos.Todo do
  use Ecto.Schema
  import Ecto.Changeset

  schema "todo" do
    field :body, :string
    field :title, :string

    timestamps()
  end

  @doc false
  def changeset(todo, attrs) do
    todo
    |> cast(attrs, [:title, :body])
    |> validate_required([:title, :body])
  end
end
