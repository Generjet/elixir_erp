defmodule Erp.Repo.Migrations.CreateProductName do
  use Ecto.Migration

  def change do
    create table(:product_name) do
      add :price, :string
      add :amount, :string

      timestamps()
    end
  end
end
