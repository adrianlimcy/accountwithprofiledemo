defmodule Accountwithprofiledemo.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      AccountwithprofiledemoWeb.Telemetry,
      Accountwithprofiledemo.Repo,
      {DNSCluster, query: Application.get_env(:accountwithprofiledemo, :dns_cluster_query) || :ignore},
      {Phoenix.PubSub, name: Accountwithprofiledemo.PubSub},
      # Start the Finch HTTP client for sending emails
      {Finch, name: Accountwithprofiledemo.Finch},
      # Start a worker by calling: Accountwithprofiledemo.Worker.start_link(arg)
      # {Accountwithprofiledemo.Worker, arg},
      # Start to serve requests, typically the last entry
      AccountwithprofiledemoWeb.Endpoint
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: Accountwithprofiledemo.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    AccountwithprofiledemoWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
