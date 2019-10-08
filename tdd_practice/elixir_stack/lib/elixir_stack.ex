defmodule ElixirStack do
  def new() do
     {:ok, pid} = GenServer.start_link(StackServer, [])
  end

  def push(pid, element) do
    GenServer.cast(pid, {:push, element})
  end

  def pop(pid) do
    GenServer.call(pid, :pop)
  end

  def get_stack(pid) do
    GenServer.call(pid, :view)
  end
end

defmodule StackServer do
  use GenServer

  @impl true
  def init(stack) do
    {:ok, stack}
  end

  @impl true
  def handle_call(:pop, _from, [head | tail]) do
    {:reply, head, tail}
  end

  @impl true
  def handle_call(:view, _from, stack) do
    {:reply, stack, stack}
  end

  @impl true
  def handle_cast({:push, element}, state) do
    {:noreply, [element | state]}
  end
end
