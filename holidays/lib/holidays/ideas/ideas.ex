defmodule Holidays.Ideas do
  import Ecto.Query, warn: false

  alias Holidays.Repo
  alias Holidays.Ideas.Idea

  def list_ideas do
    Repo.all(Idea)
    |> Repo.preload([:band, :suggester, :season])
    |> Enum.sort_by(&({
        &1.band && &1.band.name,
        &1.season && &1.season.name,
        &1.suggester && &1.suggester.name,
        &1.name
    }))
  end

  def get_idea!(id) do
    Repo.get!(Idea, id)
    |> Repo.preload([:band, :suggester, :season])
  end

  def create_idea(attrs \\ %{}) do
    %Idea{}
    |> Idea.changeset(attrs)
    |> Repo.insert()
  end

  def update_idea(%Idea{} = idea, attrs) do
    idea
    |> Idea.changeset(attrs)
    |> Repo.update()
  end

  def delete_idea(%Idea{} = idea) do
    Repo.delete(idea)
  end

  def change_idea(%Idea{} = idea) do
    Idea.changeset(idea, %{})
  end
end
