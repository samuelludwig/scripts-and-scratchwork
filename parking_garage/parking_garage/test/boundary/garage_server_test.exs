defmodule ParkingGarageTest.Boundary.GarageServerTest do
  use ExUnit.Case

  alias ParkingGarage.Boundary.GarageServer

  test "creates an empty parking lot when given empty init data" do
    lot = GarageServer.init([])
    assert lot == []
  end
end
