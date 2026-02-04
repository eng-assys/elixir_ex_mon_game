defmodule ElixirExMonGame.GameTest do
  use ExUnit.Case

  alias ElixirExMonGame.{Game, Player}

  describe "start/2" do
    test "starts the game state" do
      player = Player.build("Lucas", :chute, :soco, :cura)
      computer = Player.build("Robotinick", :punch, :kick, :heal)

      assert {:ok, _pid} = Game.start(computer, player)
    end
  end

  describe "info/0" do
    test "returns the current game state" do
      player = Player.build("Lucas", :chute, :soco, :cura)
      computer = Player.build("Robotinick", :punch, :kick, :heal)

      Game.start(computer, player)

      expected_response = %{
        computer: computer,
        player: player,
        status: :started,
        turn: :player
      }

      assert Game.info() == expected_response
    end
  end

  describe "update/1" do
    test "updates the game state" do
      player = Player.build("Lucas", :chute, :soco, :cura)
      computer = Player.build("Robotinick", :punch, :kick, :heal)

      Game.start(computer, player)

      new_state = %{
        computer: %{computer | life: 85},
        player: %{player | life: 50},
        status: :started,
        turn: :player
      }

      Game.update(new_state)

      expected_response = %{new_state | turn: :computer, status: :continue}

      assert Game.info() == expected_response
    end
  end
end
