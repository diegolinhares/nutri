defmodule NutriWeb.MealsController do
  use NutriWeb, :controller

  alias Nutri.Meal

  def create(conn, params) do
    with {:ok, %Meal{} = meal} <- Nutri.create_meal(params) do
      conn
      |> put_status(:created)
      |> render("create.json", meal: meal)
    end
  end
end
