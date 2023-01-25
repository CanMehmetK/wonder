defmodule Httpserver.Router do
  use Plug.Router

  # using Plug.Debugger for cases when an error occurs, like with the error of decoding json, a server responds with a nice error page.
  if Mix.env() == :dev do
    use Plug.Debugger
  end

  plug(:match)

  plug(Plug.Parsers,
    parsers: [:json],
    pass: ["application/json"],
    json_decoder: Jason
  )

  plug(:dispatch)

  get "/" do
    # Get request to localhost:8000
    send_resp(conn, 200, "Wellcome to my API")
  end

  get "/hello/:name" do
    # Get request to localhost:8000
    send_resp(conn, 200, "Hello #{name}")
  end

  post "/hello" do
    # json body of POST request {"name": "John"} is parsed to %{"name" => "John"}
    # so it can be accesable with e.g. Map.get(conn.body_params, "name") or with pattern matching
    name =
      case conn.body_params do
        %{"name" => a_name} -> a_name
        _ -> ""
      end

    # returning JSON: {"id":1, "name": name}
    response = %{"id" => 1, "name" => name}
    send_resp(conn |> put_resp_content_type("application/json"), 200, Jason.encode!(response))
  end

  post "/test" do
    response = Map.from_struct(SubmitBetResponse)
    send_resp(conn |> put_resp_content_type("application/json"), 200, Jason.encode!(response))
  end

  #  default case for nothing matching about
  match _ do
    send_resp(conn, 404, "There is not route for your call")
  end
end
