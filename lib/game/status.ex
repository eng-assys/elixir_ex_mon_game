defmodule ElixirExMonGame.Game.Status do
  def print_game_status(%{player: player, computer: computer, turn: turn, status: status}) do
    IO.puts("""
    ============================
    Game Status: #{status}
    Turn: #{turn}
    ----------------------------
    Player: #{player.name}
    Life: #{player.life}/100
    ----------------------------
    Computer: #{computer.name}
    Life: #{computer.life}/100
    ============================
    """)
  end

  def print_wrong_move_message(move) do
    IO.puts("The move '#{move}' is not valid. Please choose a valid move.")
  end
end
