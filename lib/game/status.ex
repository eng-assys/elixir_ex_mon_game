defmodule ElixirExMonGame.Game.Status do
  def print_game_status(%{status: :started} = info) do
    IO.puts("\nGame started!")
    IO.inspect(info)
    IO.puts("==============================")
  end

  def print_game_status(%{status: :continue, turn: player} = info) do
    IO.puts("\nIt's #{player}'s turn!")
    IO.inspect(info)
    IO.puts("==============================")
  end

  def print_game_status(%{status: :game_over} = info) do
    IO.puts("\nThe game is over")
    IO.inspect(info)
    IO.puts("==============================")
  end

  def print_wrong_move_message(move) do
    IO.puts("The move '#{move}' is not valid. Please choose a valid move.")
  end

  def print_move_message(:computer, :attack, damage) do
    IO.puts("The Player attacked the computer and caused #{damage} damage!")
  end

  def print_move_message(:player, :attack, damage) do
    IO.puts("The Computer attacked the Player and caused #{damage} damage!")
  end

  def print_move_message(:computer, :heal, heal_amount) do
    IO.puts("The Computer healed itself for #{heal_amount} life points!")
  end

  def print_move_message(:player, :heal, heal_amount) do
    IO.puts("The Player healed itself for #{heal_amount} life points!")
  end

end
