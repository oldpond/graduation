defmodule Graduation.Repo do
  use Ecto.Repo,
    otp_app: :graduation,
    adapter: Ecto.Adapters.Postgres
end
