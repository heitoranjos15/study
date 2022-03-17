defmodule Darts do
  import :math
  @type position :: {number, number}

  @doc """
  Calculate the score of a single dart hitting a target
  """
  def score({x, y}) do
    distance(x, y)
    |> findScore
  end

  def distance(x, y) do
    sqrt(x * x + y * y)
  end

  def findScore(units) do
    cond do
      units <= 1 -> 10
      units <= 5 -> 5
      units <= 10 -> 1
      true -> 0
    end
  end
end
