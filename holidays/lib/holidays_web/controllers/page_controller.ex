defmodule HolidaysWeb.PageController do
  use HolidaysWeb, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
