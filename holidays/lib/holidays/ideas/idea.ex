defmodule Holidays.Ideas.Idea do
  use Ecto.Schema
  import Ecto.Changeset

  alias Holidays.Bands.Band

  schema "ideas" do
    field :description, :string
    field :name, :string
    belongs_to :band, Band


    timestamps()
  end

  @doc false
  def changeset(idea, attrs) do
    idea
    |> cast(attrs, [:name, :description, :band_id])
    |> validate_required([:name, :band_id])
    |> foreign_key_constraint(:band_id)
  end
end
