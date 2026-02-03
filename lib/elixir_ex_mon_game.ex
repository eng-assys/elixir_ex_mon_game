defmodule ElixirExMonGame do
  alias ElixirExMonGame.Player

  @doc """
    Creates a player
    ElixirExMonGame.create_player("Lucas", :chute, :soco, :cura)
  """
  def create_player(name, move_avg, move_rnd, move_real) do
    Player.build(name, move_rnd, move_avg, move_real)
  end
end
