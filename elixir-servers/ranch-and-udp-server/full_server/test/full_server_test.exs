defmodule FullServerTest do
  use ExUnit.Case
  doctest FullServer

  test "greets the world" do
    assert FullServer.hello() == :world
  end
end
