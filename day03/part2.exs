#!/usr/bin/env elixir

defmodule P2 do
  def o2([elem], _pos), do: to_i(elem)

  def o2(list, pos) do
    groups = Enum.group_by(list, &elem(&1, pos))
    group0 = groups["0"] || []
    group1 = groups["1"] || []
    if length(group0) > length(group1) do
      o2(group0, pos + 1)
    else
      o2(group1, pos + 1)
    end
  end

  def co2([elem], _pos), do: to_i(elem)

  def co2(list, pos) do
    groups = Enum.group_by(list, &elem(&1, pos))
    group0 = groups["0"] || []
    group1 = groups["1"] || []
    if length(group1) < length(group0) do
      co2(group1, pos + 1)
    else
      co2(group0, pos + 1)
    end
  end

  defp to_i(tuple), do:
    tuple
    |> Tuple.to_list()
    |> Enum.join("")
    |> String.to_integer(2)
end

input =
  File.stream!("input.txt")
  |> Stream.map(&String.trim/1)
  |> Stream.map(&String.split(&1, "", trim: true))
  |> Enum.map(&List.to_tuple/1)

IO.inspect(P2.o2(input, 0) * P2.co2(input, 0))
