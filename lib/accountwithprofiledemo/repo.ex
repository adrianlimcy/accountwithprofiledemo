defmodule Accountwithprofiledemo.Repo do
  use Ecto.Repo,
    otp_app: :accountwithprofiledemo,
    adapter: Ecto.Adapters.Postgres
end
