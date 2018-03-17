defmodule Holidays.Bands.Band do
  use Ecto.Schema
  import Ecto.Changeset


  schema "bands" do
    field :description, :string
    field :name, :string

    timestamps()
  end

  @doc false
  def changeset(band, attrs) do
    band
    |> cast(attrs, [:name, :description])
    |> validate_required([:name, :description])
  end
end
