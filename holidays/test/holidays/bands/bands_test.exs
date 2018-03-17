defmodule Holidays.BandsTest do
  use Holidays.DataCase

  alias Holidays.Bands
  alias Holidays.Bands.Band

  describe "list_bands/0" do
    test "returns all bands" do
      insert_list(3, :band)
      assert length(Bands.list_bands()) == 3
    end
  end

  describe "get_band!/1" do
    test "returns the band with given id" do
      band = insert(:band)
      assert Bands.get_band!(band.id) == band
    end
  end

  describe "create_band/1" do
    test "with valid data creates a band" do
      attrs = params_for(:band)
      assert {:ok, %Band{} = band} = Bands.create_band(attrs)
      assert band.description == attrs.description
      assert band.name == attrs.name
    end

    test "with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Bands.create_band(%{name: nil})
    end
  end

  describe "update_band/2" do
    test "with valid data updates the band" do
      band = insert(:band)
      assert {:ok, band} = Bands.update_band(band, %{name: "new name", description: "new description"})
      assert %Band{} = band
      assert band.name == "new name"
      assert band.description == "new description"
    end

    test "with invalid data returns error changeset" do
      band = insert(:band)
      assert {:error, %Ecto.Changeset{}} = Bands.update_band(band, %{name: nil})
      assert band == Bands.get_band!(band.id)
    end
  end

  describe "delete_band/1" do
    test "deletes the band" do
      band = insert(:band)
      assert {:ok, %Band{}} = Bands.delete_band(band)
      assert_raise Ecto.NoResultsError, fn -> Bands.get_band!(band.id) end
    end
  end

  describe "change_band/1" do
    test "returns a band changeset" do
      band = insert(:band)
      assert %Ecto.Changeset{} = Bands.change_band(band)
    end
  end
end
