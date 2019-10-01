defmodule ParkingGarage.Core.Vehicle do
  @enforce_keys [:vehicle_type, :license_plate]
  defstruct ~[vehicle_type license_plate state]a

  @type t() :: %__MODULE__{
    vehicle_type: :truck | :car | :motorcycle,
    license_plate: String.t(),
    state: String.t() | nil
  }
end
