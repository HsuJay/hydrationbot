defmodule Hydrationbot.Router do
  use Plug.Router
  use Plug.Debugger
  require Logger

  plug(Plug.Logger, log: :debug)

  plug(:match)
  plug(:dispatch)

  # Simple GET Request handler for path /hello
  get "/hello" do
      send_resp(conn, 200, "world")
  end

  # Basic example to handle POST requests with a JSON body
  post "/post" do
      {:ok, body, conn} = read_body(conn)
      body = Poison.decode!(body)
      IO.inspect(body)
      send_resp(conn, 201, "created: #{get_in(body, ["message"])}")
  end

  # Basic POST for webhook
  post "/webhook" do
      send_resp(conn, 200, ~s({"text":"ok"}))
  end

  # "Default" route that will get called when no other route is matched
  match _ do
      send_resp(conn, 404, "oops")
  end
end
