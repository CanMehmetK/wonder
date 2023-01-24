defmodule Httpserver.HelloWorldPlug do
  import Plug.Conn

  def init(options), do: options

  def call(conn, _opts) do
    put_resp_content_type(conn, "text/plain")
    |> send_resp(200, "Hello World!\n")
  end
end
