# StockBeam

**TODO: Add description**

## Installation

If [available in Hex](https://hex.pm/docs/publish), the package can be installed
by adding `stock_beam` to your list of dependencies in `mix.exs`:

```elixir
def deps do
  [
    {:stock_beam, "~> 0.1.0"}
  ]
end
```

## How to run

```elixir
1. mix escript.build
2. mix run --no-halt
```

## Client CLI (in another terminal session)

```elixir
  * ./stock_beam --heart-beat "OK"
  * ./stock_beam --login "Name"
  * ./stock_beam --list_users
```

Documentation can be generated with [ExDoc](https://github.com/elixir-lang/ex_doc)
and published on [HexDocs](https://hexdocs.pm). Once published, the docs can
be found at [https://hexdocs.pm/stock_beam](https://hexdocs.pm/stock_beam).
