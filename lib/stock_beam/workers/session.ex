defmodule StockBeam.Workers.Session do
  use GenServer

  ### GenServer API

  def init(state), do: {:ok, state}

  def handle_call({:add_user, {:ok, user}}, _from, state) do
     {:reply, nil, [user | state]}
  end

  ###  Client API / Helper functions

  def start_link(state \\ []) do
    GenServer.start_link(__MODULE__, state, name: __MODULE__)
  end

  def add_user(user) do
    GenServer.call(__MODULE__, {:add_user, user})
  end
end
