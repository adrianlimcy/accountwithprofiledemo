
defmodule AccountwithprofiledemoWeb.AccountLive.Index do
  use AccountwithprofiledemoWeb, :live_view
  alias Accountwithprofiledemo.Accounts

  @impl true
  def mount(_params, _sessions, socket) do
    {:ok, stream(socket, :accounts, Accounts.list_accounts)}
  end

  @impl true
  def handle_params(params, _url, socket) do
    {:noreply, apply_action(socket, socket.assigns.live_action, params)}
  end

  defp apply_action(socket, :index, _params) do
    socket
    |> assign(:page_title, "Listing Users")
    |> assign(:comment, nil)
  end
end
