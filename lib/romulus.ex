defmodule Romulus do

  @numerals %{
    1000 => "M",
    900  => "CM",
    500  => "D",
    400  => "CD",
    100  => "C",
    90   => "XC",
    50   => "L",
    40   => "XL",
    10   => "X",
    9    => "IX",
    5    => "V",
    4    => "IV",
    1    => "I"
  }

  def encode(0), do: ""
  def encode(value) when value > 4999, do: raise(ArgumentError, message: "Number too large.")
  def encode(value) do
    {key, val} = resolve_next_symbol(value)
    val <> encode(value - key)
  end

  defp resolve_next_symbol(value) do
    Enum.reverse(@numerals) |> Enum.find(fn {key, _} -> (value - key) >= 0 end)
  end

end
