defmodule NutriWeb.UsersView do
  use NutriWeb, :view

  alias Nutri.User

  def render("create.json", %{user: %User{} = user}) do
    %{
      message: "User was created!",
      user: user
    }
  end
end
