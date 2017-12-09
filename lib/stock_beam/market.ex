defmodule StockBeam.Market do
  @enforce_keys [:users]
  defstruct [:users]

  def new do
    {:ok, %StockBeam.Market{users: []}}
  end
end
