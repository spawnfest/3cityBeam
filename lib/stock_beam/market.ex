defmodule StockBeam.Market do
  alias __MODULE__

  @enforce_keys [:users]
  defstruct [:users]

  def new do
    {:ok, %Market{users: []}}
  end

  def add_user(%Market{users: users}, user) do
    {:ok, %Market{users: [user | users]}}
  end
end
