defmodule ErpWeb.SaleLive.Index do
  use ErpWeb, :live_view

  alias Erp.Borluulalt
  alias Erp.Borluulalt.Sale

  @impl true
  def mount(_params, _session, socket) do
    {:ok, assign(socket, :product_name, list_product_name())}
  end

  @impl true
  def handle_params(params, _url, socket) do
    {:noreply, apply_action(socket, socket.assigns.live_action, params)}
  end

  defp apply_action(socket, :edit, %{"id" => id}) do
    socket
    |> assign(:page_title, "Edit Sale")
    |> assign(:sale, Borluulalt.get_sale!(id))
  end

  defp apply_action(socket, :new, _params) do
    socket
    |> assign(:page_title, "New Sale")
    |> assign(:sale, %Sale{})
  end

  defp apply_action(socket, :index, _params) do
    socket
    |> assign(:page_title, "Listing Product name")
    |> assign(:sale, nil)
  end

  @impl true
  def handle_event("delete", %{"id" => id}, socket) do
    sale = Borluulalt.get_sale!(id)
    {:ok, _} = Borluulalt.delete_sale(sale)

    {:noreply, assign(socket, :product_name, list_product_name())}
  end

  defp list_product_name do
    Borluulalt.list_product_name()
  end
end
