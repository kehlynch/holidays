defmodule Holidays.Ideas.Idea do
  use Ecto.Schema
  import Ecto.Changeset

  alias Holidays.Bands.Band
  alias Holidays.Seasons.Season
  alias Holidays.Users.User

  schema "ideas" do
    field :description, :string
    field :name, :string
    belongs_to :band, Band
    belongs_to :season, Season
    belongs_to :suggester, User


    timestamps()
  end

  @doc false
  def changeset(idea, attrs) do
    idea
    |> cast(attrs, [:name, :description, :band_id, :season_id, :suggester_id])
    |> validate_required([:name, :band_id])
    |> foreign_key_constraint(:band_id)
    |> foreign_key_constraint(:season_id)
    |> foreign_key_constraint(:suggester_id)
  end
end
