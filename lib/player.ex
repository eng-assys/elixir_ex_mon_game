defmodule ElixirExMonGame.Player do
  @required_keys [:life, :move_avg, :move_heal, :move_rnd, :name]
  @max_life 100

  @enforce_keys @required_keys
  defstruct @required_keys

  @doc """
    Builds a player struct
    ElixirExMonGame.Player.build("Lucas", :chute, :soco, :cura)
  """
  @spec build(any(), any(), any(), any()) :: %ElixirExMonGame.Player{
          life: 100,
          move_avg: any(),
          move_heal: any(),
          move_rnd: any(),
          name: any()
        }
  def build(name, move_rnd, move_avg, move_heal) do
    %ElixirExMonGame.Player{
      life: @max_life,
      move_avg: move_avg,
      move_heal: move_heal,
      move_rnd: move_rnd,
      name: name
    }
  end
end
