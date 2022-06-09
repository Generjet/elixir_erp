defmodule Erp.Borluulalt.Sale do
  use Ecto.Schema
  import Ecto.Changeset

  schema "product_name" do
    field :amount, :string
    field :price, :string

    timestamps()
  end

  @doc false
  def changeset(sale, attrs) do
    sale
    |> cast(attrs, [:price, :amount])
    |> validate_required([:price, :amount])
  end
end
