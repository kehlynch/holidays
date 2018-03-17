defmodule Holidays.Repo.Migrations.CreateIdeas do
  use Ecto.Migration

  def change do
    create table(:ideas) do
      add :name, :string
      add :description, :text
      add :band_id, references(:bands, on_delete: :nothing)

      timestamps()
    end

    create index(:ideas, [:band_id])
  end
end
