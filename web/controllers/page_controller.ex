defmodule Neplaces.PageController do
  use Neplaces.Web, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
