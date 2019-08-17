defmodule Server do
  use GenServer

  require Logger

  def start_link(args) do
    GenServer.start_link(__MODULE__, args, name: __MODULE__)
  end

  def init(port: port) do
    opts = [{:port, port}]

    {:ok, pid} = :ranch.start_listener(:network, :ranch_tcp, opts, Handler, [])

    Logger.info(fn -> "Listen for connections on port #{port}" end)

    {:ok, pid}
  end
end
