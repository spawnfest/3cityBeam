defmodule StockBeam.Workers.Market do
  use GenServer

  ### GenServer API

  def init(state), do: {:ok, state}

  def handle_call({:add_user, user}, _from, state) do
     {:reply, nil, StockBeam.Market.add_user(state, user)}
  end

  ###  Client API / Helper functions

  def start_link(state \\ []) do
    GenServer.start_link(__MODULE__, state, name: __MODULE__)
  end

  def add_user(user) do
    GenServer.call(__MODULE__, {:add_user, user})
  end
end
