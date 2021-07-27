defmodule NutriWeb.PageController do
  use NutriWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
