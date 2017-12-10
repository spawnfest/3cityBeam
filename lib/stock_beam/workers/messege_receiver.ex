defmodule StockBeam.Workers.MessageReceiver do
  use GenServer

  def start_link(opts \\ []) do
    GenServer.start_link(__MODULE__, :ok, opts)
  end

  def init (:ok) do
    {:ok, _socket} = :gen_udp.open(21337)
  end

  # Handle UDP data
  def handle_info({:udp, _socket, _ip, _port, data}, state) do
    message = parse_data(data)
    case message do
      {:heart_beat, arg} -> IO.puts("HEARTBEAT: #{arg}")
      {:login, arg} -> login_user(arg)
      {:list_users, _arg} -> list_users()
      {_, _} -> IO.puts("Handler not defined")
    end
    {:noreply, state}
  end

  # Ignore everything else
  def handle_info({_, _socket}, state) do
    {:noreply, state}
  end

  defp parse_data(data) do
    [action, arg] = List.to_string(data)
    |> String.split(",")

    List.to_tuple([String.to_atom(action), arg])
  end

  def login_user(name) do
    StockBeam.User.new(name)
    |> StockBeam.Workers.Session.sign_in
    |> IO.inspect(label: "User signed in:")
  end

  def list_users do
    StockBeam.Workers.Session.list_users |> IO.inspect(label: "Signed users")
  end
end
