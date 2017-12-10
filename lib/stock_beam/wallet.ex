defmodule StockBeam.Wallet do
  @moduledoc """
  Basic bahaviour for User wallet.
  It holds info about the User's Assets
  """
  alias __MODULE__

  @enforce_keys [:assets]
  defstruct [:assets]

  def new do
    %Wallet{assets: []}
  end
end
