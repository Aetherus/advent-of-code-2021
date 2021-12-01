#!/usr/bin/env elixir

File.stream!("input.txt")
|> Stream.map(&String.trim/1)
|> Stream.map(&String.to_integer/1)
|> Stream.chunk_every(4, 1, :discard)
|> Enum.count(fn [a, _, _, d] -> a < d end)
|> IO.inspect()
