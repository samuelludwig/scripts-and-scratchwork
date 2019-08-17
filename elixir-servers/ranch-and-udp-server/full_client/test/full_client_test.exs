defmodule FullClientTest do
  use ExUnit.Case
  doctest FullClient

  test "greets the world" do
    assert FullClient.hello() == :world
  end
end
