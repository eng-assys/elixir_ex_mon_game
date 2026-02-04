defmodule ElixirExMonGame do
  alias ElixirExMonGame.{Player, Game}
  alias ElixirExMonGame.Game.{Status, Actions}

  @computer_name "Robotinick"
  @computer_moves [:move_avg, :move_rnd, :move_heal]
  @doc """
    Creates a player
    ElixirExMonGame.create_player("Lucas", :chute, :soco, :cura)
  """
  def create_player(name, move_avg, move_rnd, move_real) do
    Player.build(name, move_rnd, move_avg, move_real)
  end

  def start_game(player) do
    @computer_name
    |> create_player(:punch, :kick, :heal)
    |> Game.start(player)

    Status.print_game_status(Game.info())
  end

  def make_move(move) do
    Game.info()
    |> Map.get(:status)
    |> handle_game_status(move)

    computer_move(Game.info())
  end

  defp handle_game_status(:game_over, _move), do: Status.print_game_status(Game.info())

  defp handle_game_status(_other, move) do
    move
    |> Actions.fetch_move()
    |> do_move()
  end

  defp do_move({:error, move}), do: Status.print_wrong_move_message(move)

  defp do_move({:ok, move}) do
    case move do
      :move_heal -> Actions.heal()
      ^move -> Actions.attack(move)
    end

    Status.print_game_status(Game.info())
  end

  defp computer_move(%{status: :continue, turn: :computer}) do
    move = {:ok, Enum.random(@computer_moves)}
    do_move(move)
  end

  defp computer_move(_), do: :ok
end
