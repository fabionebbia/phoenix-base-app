defmodule App.Repo.Migrations.CreateTodo do
  use Ecto.Migration

  def change do
    create table(:todo) do
      add :title, :string
      add :body, :text

      timestamps()
    end
  end
end
