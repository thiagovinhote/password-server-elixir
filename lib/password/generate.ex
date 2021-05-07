defmodule Password.Generate do
  alias Password.Randomizer

  def random(params) do
    password_size = Map.get(params, "password_size", 10)

    options =
      params
      |> Map.delete("password_size")
      |> prepare()

    1..16
    |> Enum.map(fn _ -> exec(options, password_size) end)
    |> evaludate()
  end

  defp prepare(params) do
    %{
      "include_numbers" => true,
      "lowercase_characters" => true,
      "uppercase_characters" => true
    }
    |> Map.merge(params)
    |> Map.values()
  end

  defp exec(options, size) do
    case options do
      [true, false, false] -> Randomizer.randomizer(size, :numeric)
      [true, false, true] -> Randomizer.randomizer(size, :alpha_numeric_upcase)
      [true, true, false] -> Randomizer.randomizer(size, :alpha_numeric_downcase)
      [false, true, true] -> Randomizer.randomizer(size, :alpha)
      [false, true, false] -> Randomizer.randomizer(size, :downcase)
      [false, false, true] -> Randomizer.randomizer(size, :upcase)
      _ -> Randomizer.randomizer(size, :all)
    end
  end

  defp evaludate(values) do
    {:ok, values}
  end
end
