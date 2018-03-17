defmodule HolidaysWeb.SeasonControllerTest do
  use HolidaysWeb.ConnCase

  alias Holidays.Repo
  alias Holidays.Seasons.Season

  describe "index" do
    test "lists seasons", %{conn: conn} do
      conn = get conn, season_path(conn, :index)
      assert html_response(conn, 200) =~ "Seasons"
    end
  end

  describe "new season" do
    test "renders form", %{conn: conn} do
      conn = get conn, season_path(conn, :new)
      assert html_response(conn, 200) =~ "New Season"
    end
  end

  describe "create season" do
    test "redirects to index when data is valid", %{conn: conn} do
      attrs = params_for(:season)

      conn = post conn, season_path(conn, :create), season: attrs
      assert redirected_to(conn) == season_path(conn, :index)

      conn = get conn, season_path(conn, :index)
      assert html_response(conn, 200) =~ attrs.name
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post conn, season_path(conn, :create), season: %{name: nil}
      assert html_response(conn, 200) =~ "New Season"
    end
  end

  describe "edit season" do
    setup [:create_season]

    test "renders form for editing chosen season", %{conn: conn, season: season} do
      conn = get conn, season_path(conn, :edit, season)
      assert html_response(conn, 200) =~ "Edit Season"
    end
  end

  describe "update season" do
    setup [:create_season]

    test "redirects when data is valid", %{conn: conn, season: season} do
      conn = put conn, season_path(conn, :update, season), season: %{name: "new name"}
      assert redirected_to(conn) == season_path(conn, :index)

      conn = get conn, season_path(conn, :index)
      assert html_response(conn, 200) =~ "new name"
    end

    test "renders errors when data is invalid", %{conn: conn, season: season} do
      conn = put conn, season_path(conn, :update, season), season: %{name: nil}
      assert html_response(conn, 200) =~ "Edit Season"
    end
  end

  describe "delete season" do
    setup [:create_season]

    test "deletes chosen season", %{conn: conn, season: season} do
      conn = delete conn, season_path(conn, :delete, season)
      assert redirected_to(conn) == season_path(conn, :index)
      refute Repo.get(Season, season.id)
    end
  end

  defp create_season(_) do
    {:ok, season: insert(:season)}
  end
end
