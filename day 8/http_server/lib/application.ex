# lib/http/application.ex
defmodule HttpServer.Application do
  @moduledoc false
  use Application
  require Logger

  def start(_type, _args) do
    IO.puts "Iniciando"
    children = [
      {HttpServer, port: 8080}
    ]

    opts = [strategy: :one_for_one, name: HttpServer.Supervisor]
    Supervisor.start_link(children, opts)
  end
end
