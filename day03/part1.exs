#!/usr/bin/env elixir

use Bitwise

max = ((1 <<< 12) - 1)

gamma =
  File.stream!("input.txt")
  |> Stream.map(&String.trim/1)
  |> Stream.map(&String.split(&1, "", trim: true))
  |> Enum.zip()
  |> Enum.map(&Tuple.to_list/1)
  |> Stream.map(&Enum.frequencies/1)
  |> Stream.map(&Enum.max_by(&1, fn {_, f} -> f end))
  |> Stream.map(&elem(&1, 0))
  |> Enum.join("")
  |> String.to_integer(2)

epsilon = max - gamma

IO.inspect(epsilon * gamma)
