defmodule NewApp.RegistrationController do
  use NewApp.Web, :controller
  alias NewApp.User

  def new(conn, _params) do
    changeset = User.changeset(%User{})
    render conn, changeset: changeset
  end
end
