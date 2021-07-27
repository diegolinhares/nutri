defmodule NutriWeb.FallbackController do
  use NutriWeb, :controller

  alias NutriWeb.ErrorView

  def call(conn, {:error, error}) do
    conn
    |> put_status(error.status)
    |> put_view(ErrorView)
    |> render("error.json", result: error.result)
  end
end
