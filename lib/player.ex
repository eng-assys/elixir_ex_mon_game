defmodule ElixirExMonGame.Player do
  @enforce_keys [:life, :name, :move_rnd, :move_avg, :move_heal]
  defstruct [:life, :name, :move_rnd, :move_avg, :move_heal]

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
      life: 100,
      name: name,
      move_rnd: move_rnd,
      move_avg: move_avg,
      move_heal: move_heal
    }
  end
end
