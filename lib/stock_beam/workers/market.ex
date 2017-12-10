defmodule StockBeam.Workers.Market do
  use GenServer

  ### GenServer API

  def init(state), do: {:ok, state}

  def handle_call({:sell, price, amount, token}, _from, state) do
    transaction = %StockBeam.Transaction{type: :bid, amount: amount, price: price, owner: token}
    {_, state} = StockBeam.Market.add_transaction(:bid, state, transaction)
    {:reply, state, state}
  end

  def handle_call({:buy, price, amount, token}, _from, state) do
    transaction = %StockBeam.Transaction{type: :ask, amount: amount, price: price, owner: token}
    {_, state} = StockBeam.Market.add_transaction(:ask, state, transaction)
    {:reply, state, state}
  end

  ###  Client API / Helper functions

  def start_link({_, market}) do
    GenServer.start_link(__MODULE__, market, name: __MODULE__)
  end

  def sell(%{token: token, price: price, amount: amount}) do
    GenServer.call(__MODULE__, {:sell, price, amount, token})
  end

  def buy(%{token: token, price: price, amount: amount}) do
    GenServer.call(__MODULE__, {:buy, price, amount, token})
  end
end
