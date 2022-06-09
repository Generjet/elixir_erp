defmodule Erp.BorluulaltFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Erp.Borluulalt` context.
  """

  @doc """
  Generate a sale.
  """
  def sale_fixture(attrs \\ %{}) do
    {:ok, sale} =
      attrs
      |> Enum.into(%{
        amount: "some amount",
        price: "some price"
      })
      |> Erp.Borluulalt.create_sale()

    sale
  end
end
