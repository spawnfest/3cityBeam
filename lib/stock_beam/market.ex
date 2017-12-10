defmodule StockBeam.Market do
  alias __MODULE__

  @enforce_keys [:bids, :asks]
  defstruct [:bids, :asks]

  def new do
    {:ok, %Market{bids: [], asks: []}}
  end

  def add_transaction(:bid, market, transaction) do
    {:ok, %Market{market | bids: [transaction | market.bids]} }
  end

  def add_transaction(:ask, market, transaction) do
    {:ok, %Market{market | asks: [transaction | market.asks]} }
  end
end
