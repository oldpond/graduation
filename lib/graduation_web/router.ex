defmodule GraduationWeb.Router do
  use GraduationWeb, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
    plug GraduationWeb.Auth
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", GraduationWeb do
    pipe_through :browser

    get "/", PageController, :index
    resources "/users", UserController, only: [:index, :new, :show, :create]
    resources "/sessions", SessionController, only: [:new, :create, :delete]
    resources "/programrules", ProgramRuleController
    resources "/courses", CourseController
    resources "/courseachievements", CourseAchievementController
    resources "/studenttranscriptreports", TranscriptReportController
    resources "/studentachievementreports", StudentAchievementReportController
  end

  # Other scopes may use custom stacks.
  scope "/api", GraduationWeb.Api, as: :api do
    pipe_through :api

    resources "/transcripts", TranscriptController, only: [:index, :show]

    resources "/studentachievementreports", StudentAchievementReportController,
      only: [:index, :show]
  end
end
