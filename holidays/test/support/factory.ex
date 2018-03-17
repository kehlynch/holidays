defmodule Holidays.Factory do
  use ExMachina.Ecto, repo: Holidays.Repo


  def band_factory do
    %Holidays.Bands.Band{
      name: sequence(:name, &"band #{&1}"),
      description: sequence(:description, &"band description #{&1}"),
    }
  end
  
  def idea_factory do
    %Holidays.Ideas.Idea{
      name: sequence(:name, &"idea #{&1}"),
      description: sequence(:description, &"idea description #{&1}"),
      band: build(:band)
    }
  end

  def season_factory do
    %Holidays.Seasons.Season{
      name: sequence(:name, &"season #{&1}"),
      description: sequence(:description, &"season description #{&1}"),
    }
  end
  
  def user_factory do
    %Holidays.Users.User{
      name: sequence(:name, &"user #{&1}"),
    }
  end
end
