defmodule HolidaysWeb.SeasonController do
  use HolidaysWeb, :controller

  alias Holidays.Seasons
  alias Holidays.Seasons.Season

  def index(conn, _params) do
    seasons = Seasons.list_seasons()
    render(conn, "index.html", seasons: seasons)
  end

  def new(conn, _params) do
    changeset = Seasons.change_season(%Season{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"season" => season_params}) do
    case Seasons.create_season(season_params) do
      {:ok, _season} ->
        conn
        |> put_flash(:info, "Season created successfully.")
        |> redirect(to: season_path(conn, :index))
      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def edit(conn, %{"id" => id}) do
    season = Seasons.get_season!(id)
    changeset = Seasons.change_season(season)
    render(conn, "edit.html", season: season, changeset: changeset)
  end

  def update(conn, %{"id" => id, "season" => season_params}) do
    season = Seasons.get_season!(id)

    case Seasons.update_season(season, season_params) do
      {:ok, _season} ->
        conn
        |> put_flash(:info, "Season updated successfully.")
        |> redirect(to: season_path(conn, :index))
      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", season: season, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    season = Seasons.get_season!(id)
    {:ok, _season} = Seasons.delete_season(season)

    conn
    |> put_flash(:info, "Season deleted successfully.")
    |> redirect(to: season_path(conn, :index))
  end
end
