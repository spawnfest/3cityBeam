defmodule StockBeam.Market do
  @enforce_keys [:users]
  defstruct [:users]

  def new do
    {:ok, %StockBeam.Market{users: []}}
  end

  def add_user(%StockBeam.Market{users: users}, user) do
    {:ok, %StockBeam.Market{users: [user | users]}}
  end
end
