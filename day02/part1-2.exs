#!/usr/bin/env elixir

%{
  "forward" => dxs,
  "down" => dys1,
  "up" => dys2
} =
  File.stream!("input.txt")
  |> Stream.map(&String.split(&1, ~r/\s+/, trim: true))
  |> Stream.map(fn [command, amount] -> {command, String.to_integer(amount)} end)
  |> Enum.group_by(&elem(&1, 0), &elem(&1, 1))

IO.inspect(Enum.sum(dxs) * (Enum.sum(dys1) - Enum.sum(dys2)))

