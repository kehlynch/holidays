defmodule Holidays.Repo.Migrations.CreateSeasons do
  use Ecto.Migration

  def change do
    create table(:seasons) do
      add :name, :string
      add :description, :text

      timestamps()
    end

  end
end
