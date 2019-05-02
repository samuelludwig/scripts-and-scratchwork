{:ok, filename} =
  Date.utc_today()
  |> TodoBuilder.run()

final_message = """

> Created #{Path.relative_to_cwd(filename)}
"""

IO.puts(final_message)
