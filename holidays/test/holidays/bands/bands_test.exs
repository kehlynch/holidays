defmodule Holidays.BandsTest do
  use Holidays.DataCase

  alias Holidays.Bands

  describe "bands" do
    alias Holidays.Bands.Band

    @valid_attrs %{description: "some description", name: "some name"}
    @update_attrs %{description: "some updated description", name: "some updated name"}
    @invalid_attrs %{description: nil, name: nil}

    def band_fixture(attrs \\ %{}) do
      {:ok, band} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Bands.create_band()

      band
    end

    test "list_bands/0 returns all bands" do
      band = band_fixture()
      assert Bands.list_bands() == [band]
    end

    test "get_band!/1 returns the band with given id" do
      band = band_fixture()
      assert Bands.get_band!(band.id) == band
    end

    test "create_band/1 with valid data creates a band" do
      assert {:ok, %Band{} = band} = Bands.create_band(@valid_attrs)
      assert band.description == "some description"
      assert band.name == "some name"
    end

    test "create_band/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Bands.create_band(@invalid_attrs)
    end

    test "update_band/2 with valid data updates the band" do
      band = band_fixture()
      assert {:ok, band} = Bands.update_band(band, @update_attrs)
      assert %Band{} = band
      assert band.description == "some updated description"
      assert band.name == "some updated name"
    end

    test "update_band/2 with invalid data returns error changeset" do
      band = band_fixture()
      assert {:error, %Ecto.Changeset{}} = Bands.update_band(band, @invalid_attrs)
      assert band == Bands.get_band!(band.id)
    end

    test "delete_band/1 deletes the band" do
      band = band_fixture()
      assert {:ok, %Band{}} = Bands.delete_band(band)
      assert_raise Ecto.NoResultsError, fn -> Bands.get_band!(band.id) end
    end

    test "change_band/1 returns a band changeset" do
      band = band_fixture()
      assert %Ecto.Changeset{} = Bands.change_band(band)
    end
  end
end
