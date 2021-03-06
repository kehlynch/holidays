defmodule Holidays.Bands do
  import Ecto.Query, warn: false
  alias Holidays.Repo

  alias Holidays.Bands.Band

  def list_bands do
    Repo.all(Band)
    |> Enum.sort_by(&(&1.name))
  end

  def get_band!(id), do: Repo.get!(Band, id)

  def create_band(attrs \\ %{}) do
    %Band{}
    |> Band.changeset(attrs)
    |> Repo.insert()
  end

  def update_band(%Band{} = band, attrs) do
    band
    |> Band.changeset(attrs)
    |> Repo.update()
  end

  def delete_band(%Band{} = band) do
    Repo.delete(band)
  end

  def change_band(%Band{} = band) do
    Band.changeset(band, %{})
  end
end
