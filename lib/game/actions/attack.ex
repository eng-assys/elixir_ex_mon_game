defmodule ElixirExMonGame.Game.Actions.Attack do
  alias ElixirExMonGame.Game
  @move_avg_power 18..25
  @move_rnd_power 10..35

  def attack_opponent(opponent, move) do
    IO.puts("#{opponent} is being attacked using #{move}!")
    damage = calculate_power(move)

    opponent
    |> Game.fetch_player()
    |> Map.get(:life)
    |> calculate_total_life(damage)
    |> update_opponent_life(opponent)
  end

  defp calculate_power(:move_avg), do: Enum.random(@move_avg_power)
  defp calculate_power(:move_rnd), do: Enum.random(@move_rnd_power)

  # Alternative implementation using max function
  # defp calculate_total_life(current_life, damage) do
  #   max(current_life - damage, 0)
  # end
  defp calculate_total_life(life, damage) when life - damage < 0, do: 0
  defp calculate_total_life(life, damage), do: life - damage

  defp update_opponent_life(life, opponent) do
    Game.fetch_player(opponent)
    |> Map.put(:life, life)
  end
end
