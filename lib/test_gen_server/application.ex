defmodule TestGenServer.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      # Start the Telemetry supervisor
      TestGenServerWeb.Telemetry,
      # Start the Ecto repository
      TestGenServer.Repo,
      # Start the PubSub system
      {Phoenix.PubSub, name: TestGenServer.PubSub},
      # Start Finch
      {Finch, name: TestGenServer.Finch},
      # Start the Endpoint (http/https)
      TestGenServerWeb.Endpoint,
      {TestGenServer.NewPersonSubscriber, []}
      # Start a worker by calling: TestGenServer.Worker.start_link(arg)
      # {TestGenServer.Worker, arg}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: TestGenServer.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    TestGenServerWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
