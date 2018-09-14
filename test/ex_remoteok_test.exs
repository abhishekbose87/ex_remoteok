defmodule ExRemoteOKTest do
  use ExUnit.Case
  doctest ExRemoteOK

  test "greets the world" do
    assert ExRemoteOK.hello() == :world
  end
end
