defmodule StockBeam.User do
  @moduledoc """
  Module specified all user actions and logic in the app
  """

  @enfoce_keys [:name]
  defstruct [:name, :wallets, :uuid]

  def new(name) do
    {:ok, %StockBeam.User{name: name, wallets: [], uuid: ""}}
  end
end
