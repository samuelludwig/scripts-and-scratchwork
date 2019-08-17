defmodule Application do
  use Application

  def start(_type, _args) do
    config = Application.get_env(:network, :server)

    children = [
      {Server, config}
    ]

    opts = [strategy: :one_for_one, name: Supervisor]
    Supervisor.start_link(children, opts)
  end
end
