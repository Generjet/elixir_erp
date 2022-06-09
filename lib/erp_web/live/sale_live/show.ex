defmodule ErpWeb.SaleLive.Show do
  use ErpWeb, :live_view

  alias Erp.Borluulalt

  @impl true
  def mount(_params, _session, socket) do
    {:ok, socket}
  end

  @impl true
  def handle_params(%{"id" => id}, _, socket) do
    {:noreply,
     socket
     |> assign(:page_title, page_title(socket.assigns.live_action))
     |> assign(:sale, Borluulalt.get_sale!(id))}
  end

  defp page_title(:show), do: "Show Sale"
  defp page_title(:edit), do: "Edit Sale"
end
