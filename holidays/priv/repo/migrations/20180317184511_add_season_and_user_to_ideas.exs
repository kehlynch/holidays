defmodule Holidays.Repo.Migrations.AddSeasonAndUserToIdeas do
  use Ecto.Migration

  def change do
    alter table(:ideas) do
      add :suggester_id, references(:users)
      add :season_id, references(:seasons)
    end
  end
end
