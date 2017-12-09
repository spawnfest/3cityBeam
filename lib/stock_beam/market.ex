defmodule StockBeam.Market do
  alias __MODULE__

  @enforce_keys [:transactions]
  defstruct [:transactions]

  def new do
    {:ok, %Market{transactions: []}}
  end

  def add_transaction(market, transaction) do
    {:ok, %Market{transactions: [transaction | market.transactions]} }
  end
end
