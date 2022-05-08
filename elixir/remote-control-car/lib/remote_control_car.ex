defmodule RemoteControlCar do
  # Please implement the struct with the specified fields

  @enforce_keys [:nickname]

  defstruct [:nickname, battery_percentage: 100, distance_driven_in_meters: 0]

  def new() do
    %RemoteControlCar{nickname: "none"}
  end

  def new(nickname) do
    %RemoteControlCar{nickname: nickname}
  end

  def display_distance(%RemoteControlCar{distance_driven_in_meters: d}) do
    "#{d} meters"
  end

  def display_battery(%RemoteControlCar{battery_percentage: 0}) do
    "Battery empty"
  end

  def display_battery(%RemoteControlCar{battery_percentage: b}) do
    "Battery at #{b}%"
  end

  def drive(%RemoteControlCar{nickname: n, battery_percentage: b, distance_driven_in_meters: d}) do
    case b do
      0 ->
        %RemoteControlCar{nickname: n, battery_percentage: b, distance_driven_in_meters: d}

      _ ->
        %RemoteControlCar{
          nickname: n,
          battery_percentage: b - 1,
          distance_driven_in_meters: d + 20
        }
    end
  end
end
