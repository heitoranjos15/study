# RIGHT VERSION
# defmodule BirdCount do
#   def today([]), do: nil
#   def today([h | _]), do: h
#   def increment_day_count([]), do: [1]
#   def increment_day_count([h | t]), do: [h + 1 | t]
#   def has_day_without_birds?([]), do: false
#   def has_day_without_birds?([0 | _]), do: true
#   def has_day_without_birds?([_ | t]), do: has_day_without_birds?(t)
#   def total([]), do: 0
#   def total([h | t]), do: h + total(t)
#   def busy_days([]), do: 0
#   def busy_days([h | t]) when h >= 5, do: 1 + busy_days(t)
#   def busy_days([_ | t]), do: busy_days(t)
# end

defmodule BirdCount do
  def today([]) do
    nil
  end

  def today([head | _]) do
    head
  end

  def increment_day_count([]) do
    [1]
  end

  def increment_day_count([head | tail]) do
    add_bird = head + 1
    [add_bird | tail]
  end

  defp has_day_without_birds?(day, remaining_days) do
    if day == 0 do
      true
    else
      has_day_without_birds?(remaining_days)
    end
  end

  def has_day_without_birds?([]) do
    false
  end

  def has_day_without_birds?([head | tail]) do
    if tail do
      has_day_without_birds?(head, tail)
    else
      false
    end
  end

  defp total(total_value, list) do
    if length(list) > 0 do
      [head | tail] = list
      total(total_value, head, tail)
    else
      total_value
    end
  end

  defp total(total_value, value, rest) do
    total_value = total_value + value
    total(total_value, rest)
  end

  def total([]) do
    0
  end

  def total(list) do
    total(0, list)
  end

  defp busy_days(days_total, head, tail) when head <= 4 do
    busy_days(days_total, tail)
  end

  defp busy_days(days_total, head, tail) when head > 4 do
    busy_days(days_total + 1, tail)
  end

  defp busy_days(days_total, list) do
    if length(list) > 0 do
      [head | tail] = list
      busy_days(days_total, head, tail)
    else
      days_total
    end
  end

  def busy_days([]) do
    0
  end

  def busy_days(list) do
    busy_days(0, list)
  end
end
