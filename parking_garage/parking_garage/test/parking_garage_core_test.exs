defmodule ParkingGarageTest do
  use ExUnit.Case

  alias ParkingGarage.Core.{ParkingSpot, Ticket, Vehicle}

  setup context do
    IO.puts("Setting up #{context.test}")
    %{
      car_struct: %{
        vehicle_type: :car,
        license_plate: "12341234",
        state: "New York"
      }
    }
  end

  describe "Vehicle.new/1" do
    test "creates a new vehicle struct from fields", context do
      assert %Vehicle{} = Vehicle.new(context[:car_struct])
    end
  end

  describe "Ticket.new/1" do
    test "creates a new ticket struct from fields" do
      fields = %{
        license_plate: "12341234",
        state: "New York",
        time_stamp: ~N[2019-01-01 23:00:07]
      }
      assert %Ticket{} = Ticket.new(fields)
    end
  end

  describe "ParkingSpot.new/1" do
    test "creates a new parking spot struct from fields", context do
      car = Vehicle.new(context[:car_struct])
      fields = %{
        number: 2,
        size: :compact,
        is_occupied: true,
        occupying_vehicle: car
      }
      assert %ParkingSpot{} = ParkingSpot.new(fields)
    end

    test "requires number, size, is_occupied" do
      fields = %{
        number: nil
      }
      catch_error ParkingSpot.new(fields)
    end
  end
end
