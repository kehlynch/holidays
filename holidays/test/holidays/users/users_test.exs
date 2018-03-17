defmodule Holidays.UsersTest do
  use Holidays.DataCase

  alias Holidays.Users
  alias Holidays.Users.User

  describe "list_users/0" do
    test "returns all users" do
      insert_list(3, :user)
      assert length(Users.list_users()) == 3
    end
  end

  describe "get_user!/1" do
    test "returns the user with given id" do
      user = insert(:user)
      assert Users.get_user!(user.id) == user
    end
  end

  describe "create_user/1" do
    test "with valid data creates a user" do
      attrs = params_for(:user)
      assert {:ok, %User{} = user} = Users.create_user(attrs)
      assert user.name == attrs.name
    end

    test "with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Users.create_user(%{name: nil})
    end
  end

  describe "update_user/2" do
    test "with valid data updates the user" do
      user = insert(:user)
      assert {:ok, user} = Users.update_user(user, %{name: "new name"})
      assert %User{} = user
      assert user.name == "new name"
    end

    test "with invalid data returns error changeset" do
      user = insert(:user)
      assert {:error, %Ecto.Changeset{}} = Users.update_user(user, %{name: nil})
      assert user == Users.get_user!(user.id)
    end
  end

  describe "delete_user/1" do
    test "deletes the user" do
      user = insert(:user)
      assert {:ok, %User{}} = Users.delete_user(user)
      assert_raise Ecto.NoResultsError, fn -> Users.get_user!(user.id) end
    end
  end

  describe "change_user/1" do
    test "returns a user changeset" do
      user = insert(:user)
      assert %Ecto.Changeset{} = Users.change_user(user)
    end
  end
end
