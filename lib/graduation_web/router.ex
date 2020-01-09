defmodule GraduationWeb.Router do
  use GraduationWeb, :router

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

  scope "/", GraduationWeb do
    pipe_through :browser

    get "/", PageController, :index
    resources "/users", UserController, only: [:index, :new, :show, :create]
  end

  # Other scopes may use custom stacks.
  # scope "/api", GraduationWeb do
  #   pipe_through :api
  # end
end