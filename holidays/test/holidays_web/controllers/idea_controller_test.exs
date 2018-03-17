defmodule HolidaysWeb.IdeaControllerTest do
  use HolidaysWeb.ConnCase

  alias Holidays.Ideas

  @create_attrs %{description: "some description", name: "some name"}
  @update_attrs %{description: "some updated description", name: "some updated name"}
  @invalid_attrs %{description: nil, name: nil}

  def fixture(:idea) do
    {:ok, idea} = Ideas.create_idea(@create_attrs)
    idea
  end

  describe "index" do
    test "lists all ideas", %{conn: conn} do
      conn = get conn, idea_path(conn, :index)
      assert html_response(conn, 200) =~ "Ideas"
    end
  end

  describe "new idea" do
    test "renders form", %{conn: conn} do
      conn = get conn, idea_path(conn, :new)
      assert html_response(conn, 200) =~ "New Idea"
    end
  end

  describe "create idea" do
    test "redirects to index when data is valid", %{conn: conn} do
      conn = post conn, idea_path(conn, :create), idea: @create_attrs
      assert redirected_to(conn) == idea_path(conn, :index)
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post conn, idea_path(conn, :create), idea: @invalid_attrs
      assert html_response(conn, 200) =~ "New Idea"
    end
  end

  describe "edit idea" do
    setup [:create_idea]

    test "renders form for editing chosen idea", %{conn: conn, idea: idea} do
      conn = get conn, idea_path(conn, :edit, idea)
      assert html_response(conn, 200) =~ "Edit Idea"
    end
  end

  describe "update idea" do
    setup [:create_idea]

    test "redirects when data is valid", %{conn: conn, idea: idea} do
      conn = put conn, idea_path(conn, :update, idea), idea: @update_attrs
      assert redirected_to(conn) == idea_path(conn, :index)

      conn = get conn, idea_path(conn, :show, idea)
      assert html_response(conn, 200) =~ "some updated description"
    end

    test "renders errors when data is invalid", %{conn: conn, idea: idea} do
      conn = put conn, idea_path(conn, :update, idea), idea: @invalid_attrs
      assert html_response(conn, 200) =~ "Edit Idea"
    end
  end

  describe "delete idea" do
    setup [:create_idea]

    test "deletes chosen idea", %{conn: conn, idea: idea} do
      conn = delete conn, idea_path(conn, :delete, idea)
      assert redirected_to(conn) == idea_path(conn, :index)
      assert_error_sent 404, fn ->
        get conn, idea_path(conn, :show, idea)
      end
    end
  end

  defp create_idea(_) do
    idea = fixture(:idea)
    {:ok, idea: idea}
  end
end
