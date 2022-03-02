defmodule LogLevel do
  @level_to_atom %{
    0 => :trace,
    1 => :debug,
    2 => :info,
    3 => :warning,
    4 => :error,
    5 => :fatal
  }

  @all_levels 0..5
  @legacy_levels 1..4

  def to_label(level, legacy?) do
    cond do
      level in @legacy_levels -> @level_to_atom[level]
      level in @all_levels and not legacy? -> @level_to_atom[level]
      true -> :unknown
    end
  end

  def alert_recipient(level, legacy?) do
    label = to_label(level, legacy?)

    cond do
      label in [:error, :fatal] -> :ops
      label == :unknown and legacy? -> :dev1
      label == :unknown -> :dev2
      true -> false
    end
  end
end
