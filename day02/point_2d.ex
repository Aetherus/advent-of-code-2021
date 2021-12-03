defmodule Point2D do
  defstruct x: 0, y: 0

  def new(x, y) when is_integer(x) and is_integer(y), do:
    %__MODULE__{x: x, y: y}

  def sigil_p(string, _) do
    ~r/-?\d+/
    |> Regex.scan(string)
    |> List.flatten
    |> Enum.map(&String.to_integer/1)
    |> then(&apply(__MODULE__, :new, &1))
  end

  def add(%__MODULE__{x: x1, y: y1}, %__MODULE__{x: x2, y: y2}) do
    new(x1 + x2, y1 + y2)
  end
end

