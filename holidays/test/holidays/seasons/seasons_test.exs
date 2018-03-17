defmodule Holidays.SeasonsTest do
  use Holidays.DataCase

  alias Holidays.Seasons

  describe "seasons" do
    alias Holidays.Seasons.Season

    @valid_attrs %{description: "some description", name: "some name"}
    @update_attrs %{description: "some updated description", name: "some updated name"}
    @invalid_attrs %{description: nil, name: nil}

    def season_fixture(attrs \\ %{}) do
      {:ok, season} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Seasons.create_season()

      season
    end

    test "list_seasons/0 returns all seasons" do
      season = season_fixture()
      assert Seasons.list_seasons() == [season]
    end

    test "get_season!/1 returns the season with given id" do
      season = season_fixture()
      assert Seasons.get_season!(season.id) == season
    end

    test "create_season/1 with valid data creates a season" do
      assert {:ok, %Season{} = season} = Seasons.create_season(@valid_attrs)
      assert season.description == "some description"
      assert season.name == "some name"
    end

    test "create_season/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Seasons.create_season(@invalid_attrs)
    end

    test "update_season/2 with valid data updates the season" do
      season = season_fixture()
      assert {:ok, season} = Seasons.update_season(season, @update_attrs)
      assert %Season{} = season
      assert season.description == "some updated description"
      assert season.name == "some updated name"
    end

    test "update_season/2 with invalid data returns error changeset" do
      season = season_fixture()
      assert {:error, %Ecto.Changeset{}} = Seasons.update_season(season, @invalid_attrs)
      assert season == Seasons.get_season!(season.id)
    end

    test "delete_season/1 deletes the season" do
      season = season_fixture()
      assert {:ok, %Season{}} = Seasons.delete_season(season)
      assert_raise Ecto.NoResultsError, fn -> Seasons.get_season!(season.id) end
    end

    test "change_season/1 returns a season changeset" do
      season = season_fixture()
      assert %Ecto.Changeset{} = Seasons.change_season(season)
    end
  end
end
