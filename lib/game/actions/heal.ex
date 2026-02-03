defmodule ElixirExMonGame.Game.Actions.Heal do
  def heal_player(player_type) do
    IO.puts("It's #{player_type}'s turn to heal!")
  end
end
