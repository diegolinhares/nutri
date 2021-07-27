defmodule Nutri.Meals.UpdateTest do
  use Nutri.DataCase, async: true

  alias Nutri.{Meal, Error}
  alias Nutri.Meals.{Create, Update}

  import Nutri.Factory

  describe "call/1" do
    test "when all params are valid, returns the meal" do
      # Arrange
      {:ok, meal} =
        :meal_params
        |> build()
        |> Create.call()

      params = %{"id" => meal.id, "description" => "Carne Bovina"}

      # Act
      response = Update.call(params)

      # Assert
      assert {:ok,
              %Meal{calories: 1.0e3, date: ~U[2021-05-12 11:00:00Z], description: "Carne Bovina"}} =
               response
    end

    test "when there are invalid params, returns an error" do
      # Arrange
      params = %{"id" => 9999}

      # Act
      response = Update.call(params)

      # Assert
      assert {:error, %Error{result: "Not found Meal!", status: :not_found}} = response
    end
  end
end
