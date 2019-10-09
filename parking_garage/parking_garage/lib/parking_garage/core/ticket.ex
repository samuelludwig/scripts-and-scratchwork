defmodule ParkingGarage.Core.Ticket do
  @enforce_keys [:license_plate, :time_stamp]
  defstruct ~w[license_plate state time_stamp]a

  @type t() :: %__MODULE__{
    license_plate: String.t(),
    state: String.t() | nil,
    time_stamp: NativeDateTime.t()
  }

  def new(fields) do
    struct!(__MODULE__, fields)
  end
end
