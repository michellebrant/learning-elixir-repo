defmodule NewApp.RegistrationController do
  use NewApp.Web, :controller
  alias NewApp.User

  def new(conn, _params) do
    changeset = User.changeset(%User{})
    render conn, changeset: changeset
  end

#   def create(conn, %{"user" => user_params}) do
#   changeset = User.changeset(%User{}, user_params)

#   case NewApp.Registration.create(changeset, NewApp.Repo) do
#     {:ok, changeset} ->
#       # sign in the user
#     {:error, changeset} ->
#       # show error message
#   end
# end
def create(conn, %{"user" => user_params}) do
  changeset = User.changeset(%User{}, user_params)

  case NewApp.Registration.create(changeset, NewApp.Repo) do
    {:ok, changeset} ->
      conn
      |> put_flash(:info, "Your account was created")
      |> redirect(to: "/")
    {:error, changeset} ->
      conn
      |> put_flash(:info, "Unable to create account")
      |> render("new.html", changeset: changeset)
  end
end
end


