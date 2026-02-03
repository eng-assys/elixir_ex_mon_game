# ElixirExMonGame
Turn-based game: Player vs. Computer

Game Explanation
- Turn-based game featuring Player vs. Computer.
- Both the human and the computer start with 100 HP (Health Points).
- Each round, players can choose one of 3 moves:
  - Moderate Attack: Deals between 18-25 damage.
  - Varied Attack: Deals between 10-35 damage.
  - Healing Power: Heals between 18-25 HP.
- After every move, the screen must display what happened and the current status of each player.
- The game ends if either the player or the computer reaches 0 HP.
  - When displaying the final result, the HP should not be shown as a negative value (it should stay at 0).
- The human player can choose their character's name as well as the names of their 3 moves.

Player
- Moves:
  - Moderate, Varied, and Heal.
- 100 HP
- Name

## References
- [Maps](https://hexdocs.pm/elixir/Map.html)
- [Structs](https://elixir-lang.org/getting-started/structs.html)
- [Agent](https://hexdocs.pm/elixir/Agent.html)

## Installation

If [available in Hex](https://hex.pm/docs/publish), the package can be installed
by adding `elixir_ex_mon_game` to your list of dependencies in `mix.exs`:

```elixir
def deps do
  [
    {:elixir_ex_mon_game, "~> 0.1.0"}
  ]
end
```

Documentation can be generated with [ExDoc](https://github.com/elixir-lang/ex_doc)
and published on [HexDocs](https://hexdocs.pm). Once published, the docs can
be found at <https://hexdocs.pm/elixir_ex_mon_game>.

