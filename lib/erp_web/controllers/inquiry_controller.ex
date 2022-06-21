defmodule ErpWeb.InquiryController do
  use ErpWeb, :controller

  # also we can plug the plugs in the controller
  plug ErpWeb.Plugs.Locale, "en" when action in [:index]

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
