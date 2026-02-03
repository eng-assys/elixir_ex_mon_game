defmodule ElixirExMonGame.Player do
  @required_keys [:life, :name, :move_rnd, :move_avg, :move_heal]
  @enforce_keys @required_keys
  defstruct @required_keys

  @max_life 100

  # ElixirExMonGame.Player.build("Lucas", :chute, :soco, :cura)
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
      name: name,
      move_rnd: move_rnd,
      move_avg: move_avg,
      move_heal: move_heal
    }
  end
end
