defmodule NutriWeb.MealsView do
  use NutriWeb, :view

  alias Nutri.Meal

  def render("create.json", %{meal: %Meal{} = meal}) do
    %{
      meal: meal
    }
  end
end
