defmodule ErpWeb.PageController do
  use ErpWeb, :controller

  def index(conn, _params) do
    # render(conn, "index.html")
    # send_resp(conn, 201, "")
    # == send specific response ===
      # conn
      # |> put_resp_content_type("text/plain")
      # |> send_resp(201, "")
    # === render text and html
    # render(conn, :index)
    # === to render another layout do the following ===
    conn
    |> put_root_layout("bootstrap.html")
    |> put_flash(:info, "Лавлагаа мэдээллийн системд тавтай морил!")
    |> render("index.html")
    # # === to render NO layout do the following ===
    #   conn
    #   |> put_root_layout(false)
    #   |> render("index.html")
  end
end
