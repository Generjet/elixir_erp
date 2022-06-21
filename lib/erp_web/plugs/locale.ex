defmodule ErpWeb.Plugs.Locale do
  import Plug.Conn

  @locales ["en", "mn"]

  # Module Plug нь 2 үйлдэл хийдэг. 1-т init/1 буюу argument or option-ийг init хийнэ. 2-т эдгээр argument or options-ийг call руу шилжүүлнэ
  def init(default), do: default

  def call(%Plug.Conn{params: %{"locale" => loc}} = conn, _default) when loc in @locales do
    assign(conn, :locale, loc)
  end

  def call(conn, default) do
    assign(conn, :locale, default)
  end

end
