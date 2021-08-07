defmodule NutriWeb.UsersView do
  use NutriWeb, :view

  alias Nutri.User

  def render("create.json", %{user: %User{} = user}) do
    %{
      message: "User was created!",
      user: user
    }
  end

  def render("show.json", %{user: %User{} = user}) do
    %{
      user: user
    }
  end

  def render("delete.json", %{user: %User{} = user}) do
    %{
      message: "User was deleted!",
      user: user
    }
  end
end
