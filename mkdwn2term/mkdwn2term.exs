# Overall pretty happy with this, it turns out reading from a file and
# outputting it to the terminal is insanely easy.

# Get path of file to read.
path = "./my_file.md"

# Get binary contents of file "path".
file_contents = File.read!(path)

# Write contents of the file to the console.
IO.puts(file_contents <> "\n")

# Display the "bulleted lines" exclusively.
file_contents
|> String.split(~r/(\n|\r)/, trim: true)
|> Enum.map(&String.trim_leading(&1))
|> Enum.filter(&String.starts_with?(&1, "- "))
|> Enum.map(fn(x) -> x <> "\n" end)
|> IO.puts()

# def isolate_lines_that_start_with_s(text, s) do
#   """
#   Return a list of all lines in a text that begin with string 's'.

#   Preceding whitespace is ignored.
#   """

#   text
#   |> String.split(~r/(\n|\r)/, trim: true)
#   |> Enum.map(&String.trim_leading(&1))
#   |> Enum.filter(&String.starts_with?(&1, s))
# end
