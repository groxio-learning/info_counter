defmodule InfoCounter.Repo do
  use Ecto.Repo,
    otp_app: :info_counter,
    adapter: Ecto.Adapters.Postgres
end
