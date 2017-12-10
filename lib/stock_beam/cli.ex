defmodule StockBeam.CLI do
  def main(args \\ []) do
    args
    |> parse_args
    |> response
  end

  defp parse_args(args) do
    {opts, arg, _} =
      args
      |> OptionParser.parse(switches: [login: :boolean, heart_beat: :boolean])

    {Keyword.keys(opts), List.to_string(arg)}
  end

  defp response({[opt], arg}) do
    {ok, socket} = :gen_udp.open(8790)
    case opt do
      :heart_beat -> send_message(socket, opt, arg)
      :login -> send_message(socket, opt, arg)
      :list_users -> send_message(socket, opt, arg)
      _ -> IO.puts("Uknown command")
    end
  end

  defp send_message(socket, opt, arg) do
    :gen_udp.send(socket, {127,0,0,1}, 21337, "#{opt},#{arg}")
  end
end
