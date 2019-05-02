defmodule Mix.Tasks.Todo do
  use Mix.Task

  @shortdoc "Creates a new todo file with today's date"

  @moduledoc """
  Creates a new todo file with today's date

  ## Example

  mix todo
  """

  def run(_args) do
    {:ok, filename} =
      Date.utc_today()
      |> TodoBuilder.run()

    final_message = """

    > Created #{Path.relative_to_cwd(filename)}
    """

    IO.puts(final_message)
  end

end
