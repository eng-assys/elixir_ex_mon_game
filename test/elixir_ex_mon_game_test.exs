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

  describe "make_move/1" do
    setup do
      player = Player.build("Lucas", :chute, :soco, :cura)
      capture_io(fn -> ElixirExMonGame.start_game(player) end)

      :ok
    end

    test "when the move is valid, do the move and the computer makes a move" do

      messages = capture_io(fn -> ElixirExMonGame.make_move(:soco) end)

      assert messages =~ "The Player attacked the computer"
      assert messages =~ "It's computer's turn!"
      assert messages =~ "The Computer attacked the Player"
      assert messages =~ "It's player's turn!"
      assert messages =~ "status: :continue"

    end

    test "when the move is invalid, prints a wrong move message" do
      expected_output = "The move 'invalid_move' is not valid. Please choose a valid move.\n"

      messages = capture_io(fn -> ElixirExMonGame.make_move(:invalid_move) end)

      assert messages == expected_output
    end
  end
end
