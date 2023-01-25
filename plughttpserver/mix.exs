defmodule Httpserver.MixProject do
  use Mix.Project

  def project do
    [
      app: :httpserver,
      version: "0.1.0",
      elixir: "~> 1.13",
      start_permanent: Mix.env() == :prod,
      deps: deps()
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger],
      mod: {Httpserver.Application, []}
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:credo, "~> 1.6", only: [:dev, :test], runtime: false},
      {:dialyxir, "~> 1.1.0", only: [:dev, :test], runtime: false},
      {:ex_doc, "~> 0.23", only: :dev, runtime: false},
      {:plug_cowboy, "~> 2.1"},
      {:poolboy, "~> 1.5"},
      {:poison, "~> 5.0"},
      {:cachex, "~> 3.4"},
      {:decimal, "~> 2.0"},
      {:ecto_sql, "~> 3.9.2"},
      {:postgrex, "~> 0.16.5"},
      # {:dep_from_hexpm, "~> 0.3.0"},
      # {:dep_from_git, git: "https://github.com/elixir-lang/my_dep.git", tag: "0.1.0"}
    ]
  end
end
