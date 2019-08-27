defmodule Network.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  def start(_type, _args) do
    # Get configuration
    config = Application.get_env(:network, :server)
    # List all child processes to be supervised
    children = [
      # Starts a worker by calling: Network.Worker.start_link(arg)
      # {Network.Worker, arg}
      {Network.Server, config}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: Network.Supervisor]
    Supervisor.start_link(children, opts)
  end
end
