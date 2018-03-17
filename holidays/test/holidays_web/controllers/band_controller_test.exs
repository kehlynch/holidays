defmodule HolidaysWeb.BandControllerTest do
  use HolidaysWeb.ConnCase

  alias Holidays.{Repo, Bands}
  alias Holidays.Bands.Band

  @create_attrs %{description: "some description", name: "some name"}
  @update_attrs %{description: "some updated description", name: "some updated name"}
  @invalid_attrs %{description: nil, name: nil}

  def fixture(:band) do
    {:ok, band} = Bands.create_band(@create_attrs)
    band
  end

  describe "index" do
    test "lists all bands", %{conn: conn} do
      conn = get conn, band_path(conn, :index)
      assert html_response(conn, 200) =~ "Bands"
    end
  end

  describe "new band" do
    test "renders form", %{conn: conn} do
      conn = get conn, band_path(conn, :new)
      assert html_response(conn, 200) =~ "New Band"
    end
  end

  describe "create band" do
    test "redirects to index when data is valid", %{conn: conn} do
      conn = post conn, band_path(conn, :create), band: @create_attrs
      assert redirected_to(conn) == band_path(conn, :index)

      conn = get conn, band_path(conn, :index)
      assert html_response(conn, 200) =~ @create_attrs.name
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post conn, band_path(conn, :create), band: @invalid_attrs
      assert html_response(conn, 200) =~ "New Band"
    end
  end

  describe "edit band" do
    setup [:create_band]

    test "renders form for editing chosen band", %{conn: conn, band: band} do
      conn = get conn, band_path(conn, :edit, band)
      assert html_response(conn, 200) =~ "Edit Band"
    end
  end

  describe "update band" do
    setup [:create_band]

    test "redirects when data is valid", %{conn: conn, band: band} do
      conn = put conn, band_path(conn, :update, band), band: @update_attrs
      assert redirected_to(conn) == band_path(conn, :index)

      conn = get conn, band_path(conn, :index)
      assert html_response(conn, 200) =~ @update_attrs.name
    end

    test "renders errors when data is invalid", %{conn: conn, band: band} do
      conn = put conn, band_path(conn, :update, band), band: @invalid_attrs
      assert html_response(conn, 200) =~ "Edit Band"
    end
  end

  describe "delete band" do
    setup [:create_band]

    test "deletes chosen band", %{conn: conn, band: band} do
      conn = delete conn, band_path(conn, :delete, band)
      assert redirected_to(conn) == band_path(conn, :index)
      refute Repo.get(Band, band.id)
    end
  end

  defp create_band(_) do
    band = fixture(:band)
    {:ok, band: band}
  end
end
