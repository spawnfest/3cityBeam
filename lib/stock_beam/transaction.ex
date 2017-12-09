defmodule StockBeam.Transaction do
  @enforce_keys [:type, :amount, :price, :owner]
  defstruct [:type, :amount, :price, :owner]
end
