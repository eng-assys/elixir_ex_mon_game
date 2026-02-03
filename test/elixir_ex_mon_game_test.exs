defmodule ElixirExMonGameTest do
  use ExUnit.Case
  doctest ElixirExMonGame

  test "greets the world" do
    assert ElixirExMonGame.hello() == :world
  end
end
