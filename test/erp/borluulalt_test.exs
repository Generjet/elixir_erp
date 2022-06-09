defmodule Erp.BorluulaltTest do
  use Erp.DataCase

  alias Erp.Borluulalt

  describe "product_name" do
    alias Erp.Borluulalt.Sale

    import Erp.BorluulaltFixtures

    @invalid_attrs %{amount: nil, price: nil}

    test "list_product_name/0 returns all product_name" do
      sale = sale_fixture()
      assert Borluulalt.list_product_name() == [sale]
    end

    test "get_sale!/1 returns the sale with given id" do
      sale = sale_fixture()
      assert Borluulalt.get_sale!(sale.id) == sale
    end

    test "create_sale/1 with valid data creates a sale" do
      valid_attrs = %{amount: "some amount", price: "some price"}

      assert {:ok, %Sale{} = sale} = Borluulalt.create_sale(valid_attrs)
      assert sale.amount == "some amount"
      assert sale.price == "some price"
    end

    test "create_sale/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Borluulalt.create_sale(@invalid_attrs)
    end

    test "update_sale/2 with valid data updates the sale" do
      sale = sale_fixture()
      update_attrs = %{amount: "some updated amount", price: "some updated price"}

      assert {:ok, %Sale{} = sale} = Borluulalt.update_sale(sale, update_attrs)
      assert sale.amount == "some updated amount"
      assert sale.price == "some updated price"
    end

    test "update_sale/2 with invalid data returns error changeset" do
      sale = sale_fixture()
      assert {:error, %Ecto.Changeset{}} = Borluulalt.update_sale(sale, @invalid_attrs)
      assert sale == Borluulalt.get_sale!(sale.id)
    end

    test "delete_sale/1 deletes the sale" do
      sale = sale_fixture()
      assert {:ok, %Sale{}} = Borluulalt.delete_sale(sale)
      assert_raise Ecto.NoResultsError, fn -> Borluulalt.get_sale!(sale.id) end
    end

    test "change_sale/1 returns a sale changeset" do
      sale = sale_fixture()
      assert %Ecto.Changeset{} = Borluulalt.change_sale(sale)
    end
  end
end
