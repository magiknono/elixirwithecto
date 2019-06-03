defmodule Elixirwithecto.Repo do
  use Ecto.Repo,
    otp_app: :elixirwithecto,
    adapter: Ecto.Adapters.Postgres
end
