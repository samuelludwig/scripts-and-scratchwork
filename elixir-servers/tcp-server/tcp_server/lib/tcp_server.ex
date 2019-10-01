defmodule TcpServer do
  require Logger

  def accept(port) do
    {:ok, socket} =
      :gen_tcp.listen(port, [:binary, packet: :line,
                             active: false, reuseaddr: true])

    Logger.info("Accepting connections on port #{port}")
    loop_acceptor(socket)
  end

  def loop_acceptor(socket) do
    {:ok, client} = :gen_tcp.accept(socket)
    serve(client)
    loop_acceptor(socket)
  end

  def serve(socket) do
    socket
    |> read_line()
    |> write_line(socket)

    serve(socket)
  end

  defp read_line(socket) do
    {:ok, data} = :gen_tcp.recv(socket, 0)
    Logger.info("Recieved \"#{data}\" from client at socket")
    data
  end

  defp write_line(line, socket) do
    :gen_tcp.send(socket, "You entered: #{line}")
    phrase =
      case line do
        "1\r\n" -> "OwO\n"
        "2\r\n" -> "UwU\n"
        "3\r\n" -> "whatthefuckdidyoujustsaytomeyoulittlebitchillhaveyouknowi-\n"
        _ -> "reeeeeeeeeeeeeee " <> "#{to_string(line) == "2"}" <> "\n\r"
      end
    :gen_tcp.send(socket, phrase)
  end
end
