defmodule NutriWeb.MealsControllerTest do
  use NutriWeb.ConnCase, async: true

  alias Nutri.Meal

  import Nutri.Factory

  describe "create/2" do
    test "when all params are valid, creates the meal", %{conn: conn} do
      # Arrange
      params = %{
        "description" => "Arroz Branco",
        "calories" => "1000.0",
        "date" => "2021-05-12 00:00:00.000001"
      }

      # Act
      response =
        conn
        |> post(Routes.meals_path(conn, :create, params))
        |> json_response(:created)

      # Assert
      assert %{
               "meal" => %{
                 "calories" => 1.0e3,
                 "date" => "2021-05-12T00:00:00Z",
                 "description" => "Arroz Branco",
                 "id" => _id
               }
             } = response
    end

    test "when params are invalid, returns an error", %{conn: conn} do
      # Arrange
      params = %{
        "description" => "Arroz Branco",
        "calories" => "0",
        "date" => "2021-05-12 00:00:00.000001"
      }

      # Act
      response =
        conn
        |> post(Routes.meals_path(conn, :create, params))
        |> json_response(:bad_request)

      # Assert
      assert %{"message" => %{"calories" => ["must be greater than %{number}"]}} = response
    end
  end

  describe "show/2" do
    test "when a meal exists, show its data", %{conn: conn} do
      # Arrange
      %Meal{id: id} = insert(:meal)

      # Act
      response =
        conn
        |> get(Routes.meals_path(conn, :show, id))
        |> json_response(:ok)

      # Assert
      assert %{
               "meal" => %{
                 "calories" => 1.0e3,
                 "date" => "2021-05-12T11:00:00Z",
                 "description" => "Arroz Branco",
                 "id" => _id
               }
             } = response
    end

    test "when a meal does not exist, returns a not found message", %{conn: conn} do
      # Arrange
      id = 9999

      # Act
      response =
        conn
        |> get(Routes.meals_path(conn, :show, id))
        |> json_response(:not_found)

      # Assert
      assert %{"message" => "Not found Meal!"} = response
    end
  end

  describe "update/2" do
    test "when a meal exists, update it", %{conn: conn} do
      # Arrange
      %Meal{id: id} = insert(:meal)

      params = %{description: "Coxinha de Frango"}

      # Act
      response =
        conn
        |> put(Routes.meals_path(conn, :update, id, params))
        |> json_response(:ok)

      # Assert
      assert %{
               "meal" => %{
                 "calories" => 1.0e3,
                 "date" => "2021-05-12T11:00:00Z",
                 "description" => "Coxinha de Frango",
                 "id" => _id
               }
             } = response
    end

    test "when a meal does not exists, returns an error", %{conn: conn} do
      # Arrange
      id = 9999

      params = %{description: "Coxinha de Frango"}

      # Act
      response =
        conn
        |> put(Routes.meals_path(conn, :update, id, params))
        |> json_response(:not_found)

      # Assert
      assert %{"message" => "Not found Meal!"} = response
    end
  end

  describe "delete/2" do
    test "when a meal exists, remove it", %{conn: conn} do
      # Arrange
      %Meal{id: id} = insert(:meal)

      # Act
      response =
        conn
        |> delete(Routes.meals_path(conn, :show, id))
        |> json_response(:no_content)

      # Assert
      assert %{
               "meal" => %{
                 "calories" => 1.0e3,
                 "date" => "2021-05-12T11:00:00Z",
                 "description" => "Arroz Branco",
                 "id" => _id
               },
               "message" => "Meal was deleted!"
             } = response
    end

    test "when a meal does not exists, returns an error", %{conn: conn} do
      # Arrange
      id = 9999

      # Act
      response =
        conn
        |> delete(Routes.meals_path(conn, :delete, id))
        |> json_response(:not_found)

      # Assert
      assert %{"message" => "Not found Meal!"} = response
    end
  end
end
