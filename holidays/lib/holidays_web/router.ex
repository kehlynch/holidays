defmodule HolidaysWeb.Router do
  use HolidaysWeb, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", HolidaysWeb do
    pipe_through :browser # Use the default browser stack

    get "/", PageController, :index
    resources "/bands", BandController, except: [:show]
    resources "/ideas", IdeaController
    resources "/seasons", SeasonController
    resources "/users", UserController
  end

  # Other scopes may use custom stacks.
  # scope "/api", HolidaysWeb do
  #   pipe_through :api
  # end
end
