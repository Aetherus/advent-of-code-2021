#!/usr/bin/env elixir

File.stream!("input.txt")
|> Stream.map(&String.split(&1, ~r/\s+/, trim: true))
|> Stream.map(fn
  ["forward", amount] -> {String.to_integer(amount), 0}
  ["down", amount] -> {0, String.to_integer(amount)}
  ["up", amount] -> {0, -String.to_integer(amount)}
end)
|> Enum.reduce({0, 0}, fn {dx, dy}, {x, y} ->
  {x + dx, y + dy}
end)
|> then(fn {x, y} -> x * y end)
|> IO.inspect()

