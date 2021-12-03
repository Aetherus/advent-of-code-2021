#!/usr/bin/env elixir

defmodule AoC2021_Part2 do
  @spec count_increasing([number]) :: non_neg_integer
  def count_increasing(input) do
    do_count_increasing(input, 0)
  end

  defp do_count_increasing([a | [_, _, d | _] = tail], acc) do
    do_count_increasing(tail, acc + (if a < d, do: 1, else: 0))
  end

  defp do_count_increasing(_, acc), do: acc
end

File.stream!("input.txt")
|> Stream.map(&String.trim/1)
|> Enum.map(&String.to_integer/1)
|> AoC2021_Part2.count_increasing()
|> IO.inspect()

