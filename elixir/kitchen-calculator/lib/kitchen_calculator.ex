defmodule KitchenCalculator do
  @volume_milliliters %{
    :milliliter => 1,
    :cup => 240,
    :fluid_ounce => 30,
    :teaspoon => 5,
    :tablespoon => 15
  }

  def get_volume({_, volume}) do
    volume
  end

  def to_milliliter({unit, volume}) do
    {:milliliter, Kernel.*(volume, @volume_milliliters[unit])}
  end

  def from_milliliter({_, volume}, unit) do
    {unit, Kernel./(volume, @volume_milliliters[unit])}
  end

  def convert(volume_pair, unit) do
    volume_pair
    |> to_milliliter
    |> from_milliliter(unit)
  end
end
