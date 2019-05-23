# Mission:  Be able to show my_file.md with line-numbers.
#           Let user edit a specific line.
#           Redisplay the file with the changed line.
#           Exit when user chooses to.
#           (All in terminal.)

# Instructions will arrive in the format of
#           :edit <space> line_num <enter> string_with_newline
#           OR
#           :exit
#           (Anything else will be treated as an error.)

defmodule ShowAndEdit do
  def show_file(file) do
    {:ok, contents} = File.read(file)

    contents
    |> String.split("\n", trim: false)
    |> Enum.with_index(1)
    |> Enum.map(fn {line, line_num} -> "#{line_num} #{line}" end)
    |> Enum.each(&IO.puts(&1))

    IO.puts("^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^")
  end

  def edit_line(line_num) do
    edit = IO.gets("EDIT LINE #{line_num+1} -> ")
    {:ok, contents} = File.read("./my_file.md")

    contents
    |> String.split("\n", trim: true)
    |> List.replace_at(line_num, String.trim_trailing(edit))
    |> Enum.map(fn x -> x <> "\n" end)
    |> Enum.into(File.stream!("./my_file.md"))

    recieve_instruction()
  end

  def recieve_instruction() do
    show_file("./my_file.md")

    instruction = IO.gets("> ")

    if (instruction == ":exit\n") do
      exit("Session terminated...")
    else
      case Regex.named_captures(~r/^\:edit\s(?<line_num>\d+)$/, instruction) do
        %{"line_num" => line_num} ->
          {line_num, _} = Integer.parse(line_num)
          edit_line(line_num-1)
        _ -> exit("Invalid command, terminating...")
      end
    end
  end

end

ShowAndEdit.recieve_instruction()
