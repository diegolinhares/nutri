defmodule NutriWeb.UsersControllerTest do
  use NutriWeb.ConnCase, async: true

  alias Nutri.User

  import Nutri.Factory

  describe "create/2" do
    test "when all params are valid, creates the user", %{conn: conn} do
      # Arrange
      params = build(:user_params)

      # Act
      response =
        conn
        |> post(Routes.users_path(conn, :create, params))
        |> json_response(:created)

      # Assert
      assert %{
               "message" => "User was created!",
               "user" => %{
                 "cpf" => "00000000000",
                 "email" => "jamesbot@bots.com",
                 "id" => _id,
                 "name" => "James Bot"
               }
             } = response
    end

    test "when params are invalid, returns an error", %{conn: conn} do
      # Arrange
      params = %{}

      # Act
      response =
        conn
        |> post(Routes.users_path(conn, :create, params))
        |> json_response(:bad_request)

      # Assert
      assert %{
               "message" => %{
                 "cpf" => ["can't be blank"],
                 "email" => ["can't be blank"],
                 "name" => ["can't be blank"]
               }
             } = response
    end
  end

  describe "show/2" do
    test "when a user exists, show its data", %{conn: conn} do
      # Arrange
      %User{id: id} = insert(:user)

      # Act
      response =
        conn
        |> get(Routes.users_path(conn, :show, id))
        |> json_response(:ok)

      # Assert
      assert %{
               "user" => %{
                 "cpf" => "00000000000",
                 "email" => "jamesbot@bots.com",
                 "id" => _id,
                 "name" => "James Bot"
               }
             } = response
    end

    test "when a meal does not exist, returns a not found message", %{conn: conn} do
      # Arrange
      id = 9999

      # Act
      response =
        conn
        |> get(Routes.users_path(conn, :show, id))
        |> json_response(:not_found)

      # Assert
      assert %{"message" => "Not found User!"} = response
    end
  end
end
