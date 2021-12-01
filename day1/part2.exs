#!/usr/bin/env elixir

File.stream!("input.txt")
|> Stream.map(&String.trim/1)
|> Stream.map(&String.to_integer/1)
|> Stream.chunk_every(3, 1, :discard)
|> Stream.map(&Enum.sum/1)
|> Stream.chunk_every(2, 1, :discard)
|> Enum.count(fn [a, b] -> a < b end)
|> IO.inspect()

