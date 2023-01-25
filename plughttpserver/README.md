# Httpserver

**TODO: Add more description**
 Simple http server with plug to understand json and snake_case <~> camelCase 
 
 https://www.youtube.com/watch?v=_TjXYGXG2z8 |> nice_for_beginner()

Here what we did is create two plugs (HelloWorldPlug, Router) as described
When app run Supervisor 
     |> starts all chieldren(plug intances) 
     |> with one_for_one (every intance restarts alone does not affects others in sup tree ~..)


What about not "text/*" contents (we ll need proper http to response a request for browser...)
first lets start with an api then browser may be better for easy up things...

in to deps added ```{:poison, "~> 3.1"} ```

https://elixir-lang.org/getting-started/basic-types.html |> The problem at here is some types are not exist in Elixir
for Guid, Decimal types using 
Ecto.Guid and Decimal library, so added to deps... in project file.
Remember that using as guard this types may be headache!() at some points 

https://hexdocs.pm/elixir/guards.html |> What are the Guards()


https://hexdocs.pm/ex_unit/1.12/ExUnit.Case.html |>

  For testing in test folder appname_test.ex file generated already |> use Plug.Test added Conveniences for testing plugs.

  ```mix test ./test/httpserver_test.exs``` |> runs only one test also calling test by tag given at spec is possible 

  ```elixir httpserver_test.exs``` also runs test when you execute command in same folder with test exs file

## Installation

If [available in Hex](https://hex.pm/docs/publish), the package can be installed
by adding `httpserver` to your list of dependencies in `mix.exs`:

```elixir
def deps do
  [
    {:httpserver, "~> 0.1.0"}
  ]
end
```

Documentation can be generated with [ExDoc](https://github.com/elixir-lang/ex_doc)
and published on [HexDocs](https://hexdocs.pm). Once published, the docs can
be found at <https://hexdocs.pm/httpserver>.

