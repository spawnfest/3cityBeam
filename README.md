# StockBeam

Naive implementation of the cryptocurrency market behaviour - BeamCoin - ⌶.
In the result we build OTP app without database and web interface for training purpose and good fun \o/.
Currently the app offers just basic features and it's not completed.
Main motivation for the team(elixir beginners) is learning concepts of the OTP Concurrency.

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
