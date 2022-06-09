defmodule ErpWeb.SaleLiveTest do
  use ErpWeb.ConnCase

  import Phoenix.LiveViewTest
  import Erp.BorluulaltFixtures

  @create_attrs %{amount: "some amount", price: "some price"}
  @update_attrs %{amount: "some updated amount", price: "some updated price"}
  @invalid_attrs %{amount: nil, price: nil}

  defp create_sale(_) do
    sale = sale_fixture()
    %{sale: sale}
  end

  describe "Index" do
    setup [:create_sale]

    test "lists all product_name", %{conn: conn, sale: sale} do
      {:ok, _index_live, html} = live(conn, Routes.sale_index_path(conn, :index))

      assert html =~ "Listing Product name"
      assert html =~ sale.amount
    end

    test "saves new sale", %{conn: conn} do
      {:ok, index_live, _html} = live(conn, Routes.sale_index_path(conn, :index))

      assert index_live |> element("a", "New Sale") |> render_click() =~
               "New Sale"

      assert_patch(index_live, Routes.sale_index_path(conn, :new))

      assert index_live
             |> form("#sale-form", sale: @invalid_attrs)
             |> render_change() =~ "can&#39;t be blank"

      {:ok, _, html} =
        index_live
        |> form("#sale-form", sale: @create_attrs)
        |> render_submit()
        |> follow_redirect(conn, Routes.sale_index_path(conn, :index))

      assert html =~ "Sale created successfully"
      assert html =~ "some amount"
    end

    test "updates sale in listing", %{conn: conn, sale: sale} do
      {:ok, index_live, _html} = live(conn, Routes.sale_index_path(conn, :index))

      assert index_live |> element("#sale-#{sale.id} a", "Edit") |> render_click() =~
               "Edit Sale"

      assert_patch(index_live, Routes.sale_index_path(conn, :edit, sale))

      assert index_live
             |> form("#sale-form", sale: @invalid_attrs)
             |> render_change() =~ "can&#39;t be blank"

      {:ok, _, html} =
        index_live
        |> form("#sale-form", sale: @update_attrs)
        |> render_submit()
        |> follow_redirect(conn, Routes.sale_index_path(conn, :index))

      assert html =~ "Sale updated successfully"
      assert html =~ "some updated amount"
    end

    test "deletes sale in listing", %{conn: conn, sale: sale} do
      {:ok, index_live, _html} = live(conn, Routes.sale_index_path(conn, :index))

      assert index_live |> element("#sale-#{sale.id} a", "Delete") |> render_click()
      refute has_element?(index_live, "#sale-#{sale.id}")
    end
  end

  describe "Show" do
    setup [:create_sale]

    test "displays sale", %{conn: conn, sale: sale} do
      {:ok, _show_live, html} = live(conn, Routes.sale_show_path(conn, :show, sale))

      assert html =~ "Show Sale"
      assert html =~ sale.amount
    end

    test "updates sale within modal", %{conn: conn, sale: sale} do
      {:ok, show_live, _html} = live(conn, Routes.sale_show_path(conn, :show, sale))

      assert show_live |> element("a", "Edit") |> render_click() =~
               "Edit Sale"

      assert_patch(show_live, Routes.sale_show_path(conn, :edit, sale))

      assert show_live
             |> form("#sale-form", sale: @invalid_attrs)
             |> render_change() =~ "can&#39;t be blank"

      {:ok, _, html} =
        show_live
        |> form("#sale-form", sale: @update_attrs)
        |> render_submit()
        |> follow_redirect(conn, Routes.sale_show_path(conn, :show, sale))

      assert html =~ "Sale updated successfully"
      assert html =~ "some updated amount"
    end
  end
end
