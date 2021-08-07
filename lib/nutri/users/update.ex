defmodule Nutri.Users.Update do
  alias Nutri.{Repo, User, Error}

  def call(%{"id" => id} = params) do
    case Repo.get(User, id) do
      nil -> {:error, Error.build_not_found_user()}
      user -> update(user, params)
    end
  end

  defp update(user, params) do
    user
    |> User.update_changeset(params)
    |> Repo.update()
  end
end
