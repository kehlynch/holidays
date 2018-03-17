defmodule Holidays.Seasons.Season do
  use Ecto.Schema
  import Ecto.Changeset


  schema "seasons" do
    field :description, :string
    field :name, :string

    timestamps()
  end

  @doc false
  def changeset(season, attrs) do
    season
    |> cast(attrs, [:name, :description])
    |> validate_required([:name, :description])
  end
end
