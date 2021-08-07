defmodule Nutri.Users.Delete do
  alias Nutri.{Repo, User, Error}

  def call(id) do
    case Repo.get(User, id) do
      nil -> {:error, Error.build_not_found_user()}
      user -> Repo.delete(user)
    end
  end
end
