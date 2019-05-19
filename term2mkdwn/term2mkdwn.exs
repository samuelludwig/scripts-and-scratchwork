# Mission: find a way to accept multiple lines of input from the
# terminal at once, and write the input into an md file 'my_file.md'.

# Naive approach: read line-by-line in a loop until a terminator is
# reached.

# defmodule Term2mkdwn do
#   def get_input() do
#     IO.gets("> ")
#     |> get_line()
#   end

#   defp get_line(line, data \\ "") do
#     case line do
#       ":done\n" ->
#         File.write!("./my_file.md", data, [:append])
#       _ ->
#         new_data = data <> line
#         get_line(IO.gets("> "), new_data)
#     end
#   end
# end

# Term2mkdwn.get_input()

# Stream approach: no custom prompt possible, but certainly more
# sensible, and otherwise achieves the same thing.

defmodule Term2mkdwn do
  def get_input() do
    IO.stream(:stdio, :line)
    |> Stream.take_while(& &1 != ":done\n")
    |> Enum.into(File.stream!("./my_file.md", [:append]))
  end
end

Term2mkdwn.get_input()

# Ideal solution: Be able to accept input in a similar fashion to
# Discord (or some another text message service), where newlines can be
# entered using `shift-enter` and using `enter` normally would
# 'complete' the message- allowing the entire input to be edited before
# entry, even across newlines. This might likely be unreasonable, and
# would require a lot of "fighting" the nature of the terminal itself
# I think.
