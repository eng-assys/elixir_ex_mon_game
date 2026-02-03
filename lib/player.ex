defmodule ElixirExMonGame.Player do
  @required_keys [:life, :moves, :name]
  @max_life 100

  @enforce_keys @required_keys
  defstruct @required_keys

  @doc """
    Builds a player struct
    ElixirExMonGame.Player.build("Lucas", :chute, :soco, :cura)
  """

  def build(name, move_rnd, move_avg, move_heal) do
    %ElixirExMonGame.Player{
      life: @max_life,
      moves: %{
        move_avg: move_avg,
        move_heal: move_heal,
        move_rnd: move_rnd
      },
      name: name
    }
  end
end
