defmodule Holidays.IdeasTest do
  use Holidays.DataCase

  alias Holidays.Ideas
  alias Holidays.Ideas.Idea

  describe "list_ideas/0" do
    test "returns all ideas" do
      insert_list(3, :idea)
      assert length(Ideas.list_ideas()) == 3
    end
  end

  describe "get_idea!/1" do
    test "returns the idea with given id" do
      idea = insert(:idea)
      assert Ideas.get_idea!(idea.id) == idea
    end
  end

  describe "create_idea/1" do
    test "with valid data creates a idea" do
      attrs = params_with_assocs(:idea)
      assert {:ok, %Idea{} = idea} = Ideas.create_idea(attrs)
      assert idea.description == attrs.description
      assert idea.name == attrs.name
    end

    test "with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Ideas.create_idea(%{})
    end
  end

  describe "update_idea/2" do
    test "with valid data updates the idea" do
      idea = insert(:idea)
      assert {:ok, %Idea{} = idea} = Ideas.update_idea(idea, %{name: "new name"})
      assert idea.name == "new name"
    end

    test "with invalid data returns error changeset" do
      idea = insert(:idea)
      assert {:error, %Ecto.Changeset{}} = Ideas.update_idea(idea, %{name: nil})
      assert idea.name == Ideas.get_idea!(idea.id).name
    end
  end

  describe "delete_idea/1" do
    test "deletes the idea" do
      idea = insert(:idea)
      assert {:ok, %Idea{}} = Ideas.delete_idea(idea)
      assert_raise Ecto.NoResultsError, fn -> Ideas.get_idea!(idea.id) end
    end
  end

  describe "change_idea/1" do
    test "returns a idea changeset" do
      idea = insert(:idea)
      assert %Ecto.Changeset{} = Ideas.change_idea(idea)
    end
  end
end
