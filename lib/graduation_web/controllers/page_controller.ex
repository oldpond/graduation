defmodule GraduationWeb.PageController do
  use GraduationWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
