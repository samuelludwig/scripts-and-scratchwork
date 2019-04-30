# Get today's date
date = Date.utc_today()
year = Integer.to_string(date.year)
month = Integer.to_string(date.month)
day = Integer.to_string(date.day)

# Generate the month's full path with YYYY/MM format
month_path =
  File.cwd!()
  |> Path.join(year)
  |> Path.join(month)

# Create the month and year directories
File.mkdir_p(month_path)

# Generate the filename with today's date
filename = Path.join(month_path, day) <> ".md"

# Check existence so we don't override a file
unless File.exists?(filename) do
  # include sample header
  header = """
  ---
  date: #{Date.to_string(date)}
  ---

  To Do
  =====

  - What do you need to accomplish today?
  """

  # write to the file
  File.open(filename, [:write], fn file ->
    IO.write(file, header)
  end)
end

# Print out confirmation message
final_message = """

> Created #{Path.relative_to_cwd(filename)}
"""

IO.puts(final_message)
