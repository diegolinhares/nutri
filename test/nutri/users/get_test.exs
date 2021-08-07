defmodule Nutri.Users.GetTest do
  use Nutri.DataCase, async: true

  alias Nutri.{User, Error}
  alias Nutri.Users.{Create, Get}

  import Nutri.Factory

  describe "by_id/1" do
    test "when all params are valid, returns the user" do
      # Arrange
      {:ok, user} =
        :user_params
        |> build()
        |> Create.call()

      # Act
      response = Get.by_id(user.id)

      # Assert
      assert {:ok, %User{}} = response
    end

    test "when there are invalid params, returns an error" do
      # Arrange
      id = 9999

      # Act
      response = Get.by_id(id)

      # Assert
      assert {:error, %Error{result: "Not found User!", status: :not_found}} = response
    end
  end
end
