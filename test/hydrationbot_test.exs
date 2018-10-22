defmodule HydrationbotTest do
  use ExUnit.Case
  use Plug.Test

  doctest Hydrationbot

  alias Hydrationbot.Router

  @opts Router.init([])

  test "responds to greeting" do
    conn = conn(:get, "/hello", "")
           |> Router.call(@opts)

    assert conn.state == :sent
    assert conn.status == 200
    assert conn.resp_body == "world"
  end
end
