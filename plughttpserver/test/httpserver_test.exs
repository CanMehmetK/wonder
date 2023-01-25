defmodule HttpserverTest do

  use Plug.Test
  use ExUnit.Case

  doctest Httpserver

  test "greets the world" do
    assert Httpserver.hello() == :world
  end


  test "should-return-generated-elixir-struct-as-json" do
    file = File.read!("test/data/test.json")
    IO.inspect(file)

    opts = Httpserver.Router.init([])
    conn =
      :post
      |> conn("/test", Poison.encode!(file))
      |> put_req_header("content-type", "application/json")
      |> Httpserver.Router.call(opts)

    assert conn.state == :sent
    assert conn.status == 200

  end

end
