defmodule ElixirExMonGameTest do
  use ExUnit.Case

  import ExUnit.CaptureIO

  alias ElixirExMonGame.Player

  describe "create_player/4" do
    test "returns a player" do
      expected_response = %Player{
        name: "Lucas",
        moves: %{
          move_avg: :chute,
          move_rnd: :soco,
          move_heal: :cura
        },
        life: 100
      }

      assert expected_response == ElixirExMonGame.create_player("Lucas", :chute, :soco, :cura)
    end
  end

  describe "start_game/1" do
    test "when the game is started, it's status are printed correctly" do
      player = Player.build("Lucas", :chute, :soco, :cura)

      expected_output = """
      \nGame started!
      %{
        status: :started,
        player: %ElixirExMonGame.Player{
          life: 100,
          moves: %{move_avg: :soco, move_rnd: :chute, move_heal: :cura},
          name: "Lucas"
        },
        turn: :player,
        computer: %ElixirExMonGame.Player{
          life: 100,
          moves: %{move_avg: :punch, move_rnd: :kick, move_heal: :heal},
          name: "Robotinick"
        }
      }
      ==============================
      """

      messages = capture_io(fn -> ElixirExMonGame.start_game(player) end)

      assert messages == expected_output
      assert messages =~ "Game started!"
      assert messages =~ "status: :started"
    end
  end
end
