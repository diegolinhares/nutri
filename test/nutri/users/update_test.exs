defmodule Nutri.Users.UpdateTest do
  use Nutri.DataCase, async: true

  alias Nutri.{User, Error}
  alias Nutri.Users.{Create, Update}

  import Nutri.Factory

  describe "call/1" do
    test "when all params are valid, returns the user" do
      # Arrange
      {:ok, user} =
        :user_params
        |> build()
        |> Create.call()

      params = %{"id" => user.id, "name" => "Sherlock Bot"}

      # Act
      response = Update.call(params)

      # Assert
      assert {:ok,
              %User{}} =
               response
    end

    test "when there are invalid params, returns an error" do
      # Arrange
      params = %{"id" => 9999}

      # Act
      response = Update.call(params)

      # Assert
      assert {:error, %Error{result: "Not found User!", status: :not_found}} = response
    end
  end
end
