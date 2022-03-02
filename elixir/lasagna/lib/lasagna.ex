defmodule Lasagna do
  @minutes_total 40
  @layer_per_minutes 2
  def expected_minutes_in_oven(), do: @minutes_total

  def remaining_minutes_in_oven(minutes), do: expected_minutes_in_oven() - minutes

  def preparation_time_in_minutes(layer), do: layer * @layer_per_minutes

  def total_time_in_minutes(layer, minutes), do: preparation_time_in_minutes(layer) + minutes

  def alarm(), do: "Ding!"
end
