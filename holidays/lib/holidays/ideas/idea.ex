defmodule Holidays.Ideas.Idea do
  use Ecto.Schema
  import Ecto.Changeset


  schema "ideas" do
    field :description, :string
    field :name, :string
    field :band_id, :id

    timestamps()
  end

  @doc false
  def changeset(idea, attrs) do
    idea
    |> cast(attrs, [:name, :description])
    |> validate_required([:name, :description])
  end
end
