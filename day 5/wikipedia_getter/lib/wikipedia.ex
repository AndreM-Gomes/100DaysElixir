defmodule Wikipedia do
  def get_home() do
    {:ok, conn} = Mint.HTTP.connect(:http,"ghibliapi.herokuapp.com",80)
    {:ok, conn, request_ref} = Mint.HTTP.request(conn,"GET","/films",[],"")
    receive do
      message ->
        case Mint.HTTP.stream(conn,message) do
          :unknown -> IO.inspect message
          {:ok, conn, responses} -> IO.inspect responses
          _ -> IO.inspect "No match"
        end
    end
  end
  def get do
    spawn(fn -> Wikipedia.get_home end)
  end
end
