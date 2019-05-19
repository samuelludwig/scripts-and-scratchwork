# Mission: find a way to accept multiple lines of input from the
# terminal at once, and write the input into an md file.


# Naive approach: read line-by-line in a loop until an empty line is reached
# input = IO.stream(:stdio, :line)


# File.write!("./my_file.md", Enum.concat(input))

# Enum.each(input, &File.write!("./my_file.md", &1, mode: [:append]))
defmodule Term2mkdwn do
  def get_input() do

  end

  defp next_line(input) do
    case input do
      ":done" ->
        write_file()
      _ ->

    end
  end



end
