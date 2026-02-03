defmodule ElixirExMonGame.Game do
  use Agent

  def start(computer, player) do
    initial_value = %{computer: computer, player: player, turn: :player, status: :started}
    Agent.start_link(fn -> initial_value end, name: __MODULE__)
  end

  def info do
    Agent.get(__MODULE__, & &1)
  end

  def player, do: info().player
  def computer, do: info().computer
  def turn, do: Map.get(info(), :turn)
end
