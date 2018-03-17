defmodule HolidaysWeb.UserControllerTest do
  use HolidaysWeb.ConnCase

  alias Holidays.Repo
  alias Holidays.Users.User

  describe "index" do
    test "lists users", %{conn: conn} do
      conn = get conn, user_path(conn, :index)
      assert html_response(conn, 200) =~ "Users"
    end
  end

  describe "new user" do
    test "renders form", %{conn: conn} do
      conn = get conn, user_path(conn, :new)
      assert html_response(conn, 200) =~ "New User"
    end
  end

  describe "create user" do
    test "redirects to index when data is valid", %{conn: conn} do
      attrs = params_for(:user)

      conn = post conn, user_path(conn, :create), user: attrs
      assert redirected_to(conn) == user_path(conn, :index)

      conn = get conn, user_path(conn, :index)
      assert html_response(conn, 200) =~ attrs.name
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post conn, user_path(conn, :create), user: %{name: nil}
      assert html_response(conn, 200) =~ "New User"
    end
  end

  describe "edit user" do
    setup [:create_user]

    test "renders form for editing chosen user", %{conn: conn, user: user} do
      conn = get conn, user_path(conn, :edit, user)
      assert html_response(conn, 200) =~ "Edit User"
    end
  end

  describe "update user" do
    setup [:create_user]

    test "redirects when data is valid", %{conn: conn, user: user} do
      conn = put conn, user_path(conn, :update, user), user: %{name: "new name"}
      assert redirected_to(conn) == user_path(conn, :index)

      conn = get conn, user_path(conn, :index)
      assert html_response(conn, 200) =~ "new name"
    end

    test "renders errors when data is invalid", %{conn: conn, user: user} do
      conn = put conn, user_path(conn, :update, user), user: %{name: nil}
      assert html_response(conn, 200) =~ "Edit User"
    end
  end

  describe "delete user" do
    setup [:create_user]

    test "deletes chosen user", %{conn: conn, user: user} do
      conn = delete conn, user_path(conn, :delete, user)
      assert redirected_to(conn) == user_path(conn, :index)
      refute Repo.get(User, user.id)
    end
  end

  defp create_user(_) do
    {:ok, user: insert(:user)}
  end
end
