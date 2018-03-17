defmodule HolidaysWeb.IdeaControllerTest do
  use HolidaysWeb.ConnCase

  describe "index" do
    test "lists ideas", %{conn: conn} do
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
      attrs = params_with_assocs(:idea)
      conn = post conn, idea_path(conn, :create), idea: attrs
      assert redirected_to(conn) == idea_path(conn, :index)
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post conn, idea_path(conn, :create), idea: %{}
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
      conn = put conn, idea_path(conn, :update, idea), idea: %{description: "some updated description"}
      assert redirected_to(conn) == idea_path(conn, :index)

      conn = get conn, idea_path(conn, :show, idea)
      assert html_response(conn, 200) =~ "some updated description"
    end

    test "renders errors when data is invalid", %{conn: conn, idea: idea} do
      conn = put conn, idea_path(conn, :update, idea), idea: %{name: nil}
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
    {:ok, idea: insert(:idea)}
  end
end
