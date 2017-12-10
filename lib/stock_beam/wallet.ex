defmodule StockBeam.Wallet do
  @moduledoc """
  Basic bahaviour for User wallet.
  It holds info about the User's Assets
  """
  alias __MODULE__
  alias StockBeam.Asset

  @enforce_keys [:asset]
  defstruct [:asset]

  def new(currency) do
    %Wallet{asset:  Asset.new(currency)}
  end
end
