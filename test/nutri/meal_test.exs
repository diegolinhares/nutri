defmodule Nutri.MealTest do
  use Nutri.DataCase, async: true

  alias Nutri.Meal
  alias Ecto.Changeset

  import Nutri.Factory

  describe "changeset/2" do
    test "when all params are valid, returns a valid changeset" do
      # Arrange
      params = build(:meal_params)

      # Act
      response = Meal.changeset(params)

      # Assert
      assert %Changeset{
               changes: %{
                 calories: 1.0e3,
                 date: ~U[2021-05-12 11:00:00Z],
                 description: "Arroz Branco"
               },
               errors: [],
               valid?: true
             } = response
    end

    test "when updating a changeset, returns a valid changeset with the given changes" do
      # Arrange
      params = build(:meal_params)

      update_params = %{"description" => "Feijão"}

      # Act
      response =
        params
        |> Meal.changeset()
        |> Meal.update_changeset(update_params)

      # Assert
      assert %Changeset{
               changes: %{description: "Feijão"}
             } = response
    end

    test "when there are some error, returns an invalid changeset" do
      # Arrange
      params = build(:meal_params, %{"calories" => 0})

      # Act
      response = Meal.changeset(params)

      # Assert
      assert %Changeset{
               errors: [
                 calories:
                   {"must be greater than %{number}",
                    [validation: :number, kind: :greater_than, number: 0]}
               ],
               valid?: false
             } = response
    end
  end
end
