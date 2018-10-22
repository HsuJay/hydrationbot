defmodule Hydrationbot.SlackSender do
  def post_to_slack(encoded_msg) do
    HTTPoison.post(Application.get_env(:hydrationbot, :incoming_slack_webhook), encoded_msg)
  end

  def sendmsg(msg) do
    Poison.encode!(%{
      "username" => "hydrationbot",
      "icon_emoji" => ":potable_water:",
      "text" => msg
      })
    |> post_to_slack
  end
end
