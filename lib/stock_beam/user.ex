defmodule StockBeam.User do
  @moduledoc """
  Module specified all user actions and logic in the app
  """
  @uuid_base 3453234233

  @enfoce_keys [:name]
  defstruct [:name, :wallets, :uuid]

  def new(name) do
    {:ok, %StockBeam.User{name: name, wallets: [], uuid: generate_uuid()}}
  end

  defp generate_uuid do
    Integer.to_string(:rand.uniform(@uuid_base), 32) <> Integer.to_string(:rand.uniform(@uuid_base), 32)
  end
end
