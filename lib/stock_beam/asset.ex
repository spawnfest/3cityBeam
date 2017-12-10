defmodule StockBeam.Asset do
  @moduledoc """
  Contains info about currency and amount
  """
  alias __MODULE__

  @enforce_keys [:currency, :amount]
  defstruct [:currency, :amount]

  def new(currency) do
    %Asset{currency: currency, amount: rand_amount_for(currency)}
  end

  defp rand_amount_for("$"), do: :rand.uniform(100000)
  defp rand_amount_for("BeamCoin"), do: :rand.uniform(100)
  defp rand_amount_for(_), do: 100
end
