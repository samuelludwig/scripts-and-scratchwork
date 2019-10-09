defmodule ParkingGarage.Core.ParkingSpot do
  alias ParkingGarage.Core.Vehicle

  @enforce_keys [:number, :size, :is_occupied]
  defstruct ~w[number size is_occupied occupying_vehicle]a

  @type t() :: %__MODULE__{
    number: integer(),
    size: :large | :compact | :small,
    is_occupied: true | false,
    occupying_vehicle: %Vehicle{} | nil
  }

  def new(fields) do
    struct!(__MODULE__, fields)
  end
end
