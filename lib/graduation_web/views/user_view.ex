defmodule GraduationWeb.UserView do
  use GraduationWeb, :view

  alias Graduation.Accounts

  def first_name(%Accounts.User{name: name}) do
    name
    |> String.split(" ")
    |> Enum.at(0)
  end
end
