defmodule StockBeam.User do
  @moduledoc """
  Module specified all user actions and logic in the app
  """
  alias __MODULE__

  @uuid_base 3453234233

  @enforce_keys [:name]
  defstruct [:name, :wallets, :uuid]

  def new(name) do
    {:ok, %User{name: name, wallets: [], uuid: generate_uuid()}}
  end

  defp generate_uuid do
    Integer.to_string(:rand.uniform(@uuid_base), 32) <> Integer.to_string(:rand.uniform(@uuid_base), 32)
  end
end
