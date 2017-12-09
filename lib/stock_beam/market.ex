defmodule StockBeam.Market do
  alias __MODULE__

  @enforce_keys [:users]
  defstruct [:users]

  def new do
    {:ok, %Market{users: []}}
  end

  def add_user(%Market{users: users}, user) do
    {_status, pid} = StockBeam.Workers.User.start_link(user)
    {:ok, %Market{users: [{pid, user.uuid} | users]}}
  end
end
