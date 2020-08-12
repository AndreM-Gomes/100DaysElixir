defmodule Stack do
  use GenServer

  @doc """
  Start stack
  """
  def start_link(state \\ []) do
    GenServer.start_link(__MODULE__,state,name: __MODULE__)
  end

  @doc """
  GenServer init callback
  """
  @impl true
  def init(state), do: {:ok, state}

  @impl true
  def handle_call({:push, value}, _from, state) do
    { :reply, value, [value] ++ state }
  end

  @impl true
  def handle_call(:pop, _from, [value|state]) do
    {:reply, value,state }
  end

  @impl true
  def handle_call(:pop, _from, []) do
    {:reply, [], []}
  end

  @impl true
  def handle_call(:lookup, _from, state) do
    {:reply, state, state }
  end

  def push(value), do: GenServer.call( __MODULE__, {:push,value})
  def lookup, do: GenServer.call(__MODULE__, :lookup)
  def pop, do: GenServer.call(__MODULE__,:pop)
end
