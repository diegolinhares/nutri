defmodule NutriWeb.MealsView do
  use NutriWeb, :view

  alias Nutri.Meal

  def render("create.json", %{meal: %Meal{} = meal}) do
    %{
      message: "Meal was created!",
      meal: meal
    }
  end

  def render("show.json", %{meal: %Meal{} = meal}) do
    %{
      meal: meal
    }
  end
end
