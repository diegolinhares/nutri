defmodule NutriWeb.MealsController do
  use NutriWeb, :controller

  alias Nutri.Meal
  alias NutriWeb.FallbackController

  action_fallback FallbackController

  def create(conn, params) do
    with {:ok, %Meal{} = meal} <- Nutri.create_meal(params) do
      conn
      |> put_status(:created)
      |> render("create.json", meal: meal)
    end
  end

  def show(conn, %{"id" => id}) do
    with {:ok, %Meal{} = meal} <- Nutri.get_meal_by_id(id) do
      conn
      |> put_status(:ok)
      |> render("show.json", meal: meal)
    end
  end
end
