defmodule Hydrationbot.MixProject do
  use Mix.Project

  def project do
    [
      app: :hydrationbot,
      version: "0.1.0",
      elixir: "~> 1.7",
      start_permanent: Mix.env() == :prod,
      deps: deps()
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger, :cowboy, :plug, :poison],
      mod: {Hydrationbot.Application, []}
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:cowboy, "~> 2.5.0"},
      {:plug, "~> 1.5"},
      {:poison, "~> 3.1"},
      {:plug_cowboy, "~> 2.0"},
      {:httpoison, "~> 1.4.0"}
    ]
  end
end
