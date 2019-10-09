defmodule ParkingGarage.Core.Vehicle do
  @enforce_keys [:vehicle_type, :license_plate]
  defstruct ~w[vehicle_type license_plate state]a

  @type t() :: %__MODULE__{
    vehicle_type: :truck | :car | :motorcycle,
    license_plate: String.t(),
    state: String.t() | nil
  }

  def new(fields) do
    struct!(__MODULE__, fields)
  end
end
