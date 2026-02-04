defmodule ElixirExMonGame.Game.Actions.Heal do
  alias ElixirExMonGame.Game
  alias ElixirExMonGame.Game.Status

  @heal_power 18..25

  def heal_life(player_type) do
    IO.puts("\nIt's #{player_type}'s turn to heal!")

    player_type
    |> Game.fetch_player()
    |> Map.get(:life)
    |> calculate_total_life()
    |> set_life(player_type)
  end

  defp calculate_total_life(current_life), do: Enum.random(@heal_power) + current_life

  defp set_life(life, player_type) when life > 100, do: update_player_life(player_type, 100)
  defp set_life(life, player_type), do: update_player_life(player_type, life)

  defp update_player_life(player_type, life) do
    player_type
    |> Game.fetch_player()
    |> Map.put(:life, life)
    |> update_game(player_type, life)
  end

  defp update_game(player, player_type, life) do
    Game.info()
    |> Map.put(player_type, player)
    |> Game.update()

    Status.print_move_message(player_type, :heal, life)
  end
end
