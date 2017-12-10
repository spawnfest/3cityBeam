defmodule StockBeam.Workers.Session do
  use GenServer

  ### GenServer API

  def init(state), do: {:ok, state}

  def handle_call({:sign_in, user}, _from, state) do
    new_state = [user | state]
     {:reply, new_state, new_state}
  end

  def handle_call({:list_users}, _from, state) do
    {:reply, state, state}
  end

  ###  Client API / Helper functions

  def start_link(state \\ []) do
    GenServer.start_link(__MODULE__, state, name: __MODULE__)
  end

  def sign_in({_, user}) do
    GenServer.call(__MODULE__, {:sign_in, user})
  end

  def list_users do
    GenServer.call(__MODULE__, {:list_users})
  end
end
