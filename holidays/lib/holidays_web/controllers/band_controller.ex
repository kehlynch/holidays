defmodule HolidaysWeb.BandController do
  use HolidaysWeb, :controller

  alias Holidays.Bands
  alias Holidays.Bands.Band

  def index(conn, _params) do
    bands = Bands.list_bands()
    render(conn, "index.html", bands: bands)
  end

  def new(conn, _params) do
    changeset = Bands.change_band(%Band{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"band" => band_params}) do
    case Bands.create_band(band_params) do
      {:ok, _band} ->
        conn
        |> put_flash(:info, "Band created successfully.")
        |> redirect(to: band_path(conn, :index))
      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def edit(conn, %{"id" => id}) do
    band = Bands.get_band!(id)
    changeset = Bands.change_band(band)
    render(conn, "edit.html", band: band, changeset: changeset)
  end

  def update(conn, %{"id" => id, "band" => band_params}) do
    band = Bands.get_band!(id)

    case Bands.update_band(band, band_params) do
      {:ok, band} ->
        conn
        |> put_flash(:info, "Band updated successfully.")
        |> redirect(to: band_path(conn, :index))
      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", band: band, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    band = Bands.get_band!(id)
    {:ok, _band} = Bands.delete_band(band)

    conn
    |> put_flash(:info, "Band deleted successfully.")
    |> redirect(to: band_path(conn, :index))
  end
end
