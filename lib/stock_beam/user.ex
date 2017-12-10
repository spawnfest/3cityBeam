defmodule StockBeam.User do
  @moduledoc """
  Module specified all user actions and logic in the app
  """
  alias __MODULE__
  alias StockBeam.Wallet

  @uuid_base 3453234233

  @enforce_keys [:name]
  defstruct [:name, :wallets, :uuid]

  @default_currencies ["$", "BeamCoin"]

  def new(name) do
    {:ok, %User{name: name, wallets: create_wallets(), uuid: generate_uuid()}}
  end

  defp create_wallets do
    Enum.map(@default_currencies, fn currency -> Wallet.new(currency) end)
  end

  defp generate_uuid do
    Integer.to_string(:rand.uniform(@uuid_base), 32) <> Integer.to_string(:rand.uniform(@uuid_base), 32)
  end
end
