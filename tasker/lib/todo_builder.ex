defmodule TodoBuilder do
  def run(date) do
    year = Integer.to_string(date.year)
    month = Integer.to_string(date.month)
    day = Integer.to_string(date.day)

    month_path =
      File.cwd!()
      |> Path.join(year)
      |> Path.join(month)

    File.mkdir_p(month_path)

    filename = Path.join(month_path, day) <> ".md"

    unless File.exists?(filename) do
      header = """
      ---
      date: #{Date.to_string(date)}
      ---

      To Do
      =====

      - What do you need to accomplish today?
      """

      File.open(filename, [:write], fn file ->
        IO.write(file, header)
      end)
    end

    {:ok, filename}
  end
end
