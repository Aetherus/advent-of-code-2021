#!/usr/bin/env elixir

File.stream!("input.txt")
|> Stream.map(&String.split(&1, ~r/\s+/, trim: true))
|> Stream.map(fn [command, steps] ->
  {command, String.to_integer(steps)}
end)
|> Enum.reduce({0, 0, 0}, fn
  {"down", amount}, {x, y, aim} -> {x, y, aim + amount}
  {"up", amount}, {x, y, aim} -> {x, y, aim - amount}
  {"forward", amount}, {x, y, aim} -> {x + amount, y + aim * amount, aim}
end)
|> then(fn {x, y, _} -> x * y end)
|> IO.inspect()

