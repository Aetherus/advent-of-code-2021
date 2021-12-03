#!/usr/bin/env elixir

import Point2D, only: [sigil_p: 2]

File.stream!("input.txt")
|> Stream.map(&String.split(&1, ~r/\s+/, trim: true))
|> Stream.map(fn
  ["forward", amount] -> ~p(#{amount} 0)
  ["down", amount] -> ~p(0 #{amount})
  ["up", amount] -> ~p(0 -#{amount})
end)
|> Enum.reduce(~p(0 0), &Point2D.add/2)
|> then(fn %{x: x, y: y} -> x * y end)
|> IO.inspect()

