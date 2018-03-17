defmodule HolidaysWeb.IdeaController do
  use HolidaysWeb, :controller

  alias Holidays.{Bands, Ideas}
  alias Holidays.Ideas.Idea

  def index(conn, _params) do
    ideas = Ideas.list_ideas()
    render(conn, "index.html", ideas: ideas)
  end

  def new(conn, _params) do
    changeset = Ideas.change_idea(%Idea{})
    render(conn, "new.html", changeset: changeset, bands: get_bands())
  end

  def create(conn, %{"idea" => idea_params}) do
    case Ideas.create_idea(idea_params) do
      {:ok, _idea} ->
        conn
        |> put_flash(:info, "Idea created successfully.")
        |> redirect(to: idea_path(conn, :index))
      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset, bands: get_bands())
    end
  end

  def show(conn, %{"id" => id}) do
    idea = Ideas.get_idea!(id)
    render(conn, "show.html", idea: idea)
  end

  def edit(conn, %{"id" => id}) do
    idea = Ideas.get_idea!(id)
    changeset = Ideas.change_idea(idea)
    render(conn, "edit.html", idea: idea, changeset: changeset, bands: get_bands())
  end

  def update(conn, %{"id" => id, "idea" => idea_params}) do
    idea = Ideas.get_idea!(id)

    case Ideas.update_idea(idea, idea_params) do
      {:ok, _idea} ->
        conn
        |> put_flash(:info, "Idea updated successfully.")
        |> redirect(to: idea_path(conn, :index))
      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", idea: idea, changeset: changeset, bands: get_bands())
    end
  end

  def delete(conn, %{"id" => id}) do
    idea = Ideas.get_idea!(id)
    {:ok, _idea} = Ideas.delete_idea(idea)

    conn
    |> put_flash(:info, "Idea deleted successfully.")
    |> redirect(to: idea_path(conn, :index))
  end

  def get_bands() do
    Bands.list_bands
    |> Enum.map(&{"#{&1.name} - #{&1.description}", &1.id})
  end
end
