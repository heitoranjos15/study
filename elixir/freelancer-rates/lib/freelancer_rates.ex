defmodule FreelancerRates do
  @daily_hours 8.0
  @month_days 22.0

  def daily_rate(hourly_rate) do
    Kernel.*(@daily_hours, hourly_rate)
  end

  def apply_discount(before_discount, 0.0) do
    before_discount
  end

  def apply_discount(before_discount, discount) do
    discount_value = before_discount * (discount / 100.0)
    before_discount - discount_value
  end

  def monthly_rate(hourly_rate, discount) do
    hourly_rate
    |> daily_rate
    |> (&(@month_days * &1)).()
    |> apply_discount(discount)
    |> Float.ceil()
    |> trunc
  end

  def days_in_budget(budget, hourly_rate, discount) do
    hourly_rate
    |> apply_discount(discount)
    |> daily_rate
    |> (&(budget / &1)).()
    |> Float.floor(1)
  end
end
