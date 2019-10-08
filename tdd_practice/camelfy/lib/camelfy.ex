defmodule Camelfy do
  def to_camel(string) do
    if Regex.match?(~r{^[\s|-|_]}, string) or string == "" do
      ""
    else
      [head | tail] = String.split(string, ~r{\s|-|_}, trim: true)
      [head | Enum.map(tail, fn x -> String.capitalize(x) end)]
      |> Enum.join()
    end
  end
end
