defmodule Password.Repo do
  use Ecto.Repo,
    otp_app: :password,
    adapter: Ecto.Adapters.Postgres
end
