defmodule InfoCounterWeb.SyncLive do
  use InfoCounterWeb, :live_view

  def mount(params, _session, socket) do
    Phoenix.PubSub.subscribe(InfoCounter.PubSub, "sync")
    
    {:ok, process_params(socket, params)}
  end
  
  def process_params(socket, %{"count" => count, "name" => name}) do
    name = String.to_atom(name)
    count = String.to_integer(count)
    
    assign(socket, name: name, count: count)
  end
  
  def render(assigns) do
    ~L"""
    <h1><%= @name %>: <%= @count %></h1>
    """
  end
  
  def handle_params(params, _uri , socket) do
    {:noreply, process_params(socket, params)}
  end
  
  def handle_info({:share, count}, socket) do
    {:noreply, assign(socket, count: count)}
  end
  
  def handle_info({:sync, name, count}, socket) do
    {:noreply, push_patch(socket, to: "/sync/#{name}/#{count}")}
  end
end
