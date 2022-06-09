defmodule ErpWeb.SaleLive.FormComponent do
  use ErpWeb, :live_component

  alias Erp.Borluulalt

  @impl true
  def update(%{sale: sale} = assigns, socket) do
    changeset = Borluulalt.change_sale(sale)

    {:ok,
     socket
     |> assign(assigns)
     |> assign(:changeset, changeset)}
  end

  @impl true
  def handle_event("validate", %{"sale" => sale_params}, socket) do
    changeset =
      socket.assigns.sale
      |> Borluulalt.change_sale(sale_params)
      |> Map.put(:action, :validate)

    {:noreply, assign(socket, :changeset, changeset)}
  end

  def handle_event("save", %{"sale" => sale_params}, socket) do
    save_sale(socket, socket.assigns.action, sale_params)
  end

  defp save_sale(socket, :edit, sale_params) do
    case Borluulalt.update_sale(socket.assigns.sale, sale_params) do
      {:ok, _sale} ->
        {:noreply,
         socket
         |> put_flash(:info, "Sale updated successfully")
         |> push_redirect(to: socket.assigns.return_to)}

      {:error, %Ecto.Changeset{} = changeset} ->
        {:noreply, assign(socket, :changeset, changeset)}
    end
  end

  defp save_sale(socket, :new, sale_params) do
    case Borluulalt.create_sale(sale_params) do
      {:ok, _sale} ->
        {:noreply,
         socket
         |> put_flash(:info, "Sale created successfully")
         |> push_redirect(to: socket.assigns.return_to)}

      {:error, %Ecto.Changeset{} = changeset} ->
        {:noreply, assign(socket, changeset: changeset)}
    end
  end
end
