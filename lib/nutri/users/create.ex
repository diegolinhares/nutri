defmodule Nutri.Users.Create do
  alias Nutri.{Repo, User, Error}

  def call(params) do
    params
    |> User.changeset()
    |> Repo.insert()
    |> handle_insert()
  end

  defp handle_insert({:ok, %User{}} = user), do: user

  defp handle_insert({:error, result}) do
    {:error, Error.build(:bad_request, result)}
  end
end
