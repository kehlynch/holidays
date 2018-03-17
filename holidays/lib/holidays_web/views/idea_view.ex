defmodule HolidaysWeb.IdeaView do
  use HolidaysWeb, :view
  alias Holidays.Seasons.Season
  alias Holidays.Bands.Band

  def season_text(%Season{name: name, description: nil}) do
    name
  end
  def season_text(%Season{name: name, description: description}) do
    "#{name}: #{description}"
  end

  def band_text(%Band{name: name, description: nil}) do
    name
  end
  def band_text(%Band{name: name, description: description}) do
    "#{name}: #{description}"
  end
end
