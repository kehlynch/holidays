defmodule HolidaysWeb.LayoutView do
  use HolidaysWeb, :view

  def app_name() do
    Application.get_env(:holidays, :settings) |> IO.inspect
    Application.get_env(:holidays, :settings)[:app_name] || "Holiday Planning Tool"
  end
end
