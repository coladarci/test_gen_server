defmodule TestGenServer.Repo do
  use Ecto.Repo,
    otp_app: :test_gen_server,
    adapter: Ecto.Adapters.Postgres
end
