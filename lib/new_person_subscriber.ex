defmodule TestGenServer.NewPersonSubscriber do
  use GenServer

  def start_link([]) do
    GenServer.start_link(__MODULE__, [])
  end

  def init([]) do
    pid = self()
    :ok = Phoenix.PubSub.subscribe(TestGenServer.PubSub, "person.created")
    {:ok, {pid, [], "somerefid"}}
  end

  def handle_info(%{event: "person.created", data: person}, state) do
    IO.inspect(person, label: "Got a person!")
    TestGenServer.People.get_person!(person.id)
    {:noreply, state}
  end

  def handle_info(message, state) do
    IO.inspect("#######################")
    IO.inspect("Catch All - Received Message:")
    IO.inspect(message)
    IO.inspect("#######################")
    {:noreply, state}
  end
end
