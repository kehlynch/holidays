defmodule Holidays.Seasons do
  import Ecto.Query, warn: false
  alias Holidays.Repo

  alias Holidays.Seasons.Season

  def list_seasons do
    Repo.all(Season)
    |> Enum.sort_by(&(&1.name))
  end

  def get_season!(id), do: Repo.get!(Season, id)

  def create_season(attrs \\ %{}) do
    %Season{}
    |> Season.changeset(attrs)
    |> Repo.insert()
  end

  def update_season(%Season{} = season, attrs) do
    season
    |> Season.changeset(attrs)
    |> Repo.update()
  end

  def delete_season(%Season{} = season) do
    Repo.delete(season)
  end

  def change_season(%Season{} = season) do
    Season.changeset(season, %{})
  end
end
