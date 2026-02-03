defmodule ElixirExMonGame do
  alias ElixirExMonGame.{Player, Game}
  alias ElixirExMonGame.Game.Status

  @computer_name "Robotinick"
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
end
