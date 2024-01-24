defmodule ProductReviewWeb.ProductController do
  use ProductReviewWeb, :controller

  alias ProductReview.CS
  alias ProductReview.CS.Product

  action_fallback ProductReviewWeb.FallbackController

  def index(conn, _params) do
    products = CS.list_products()
    render(conn, :index, products: products)
  end

  def create(conn, %{"product" => product_params}) do
    with {:ok, %Product{} = product} <- CS.create_product(product_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", ~p"/api/products/#{product}")
      |> render(:show, product: product)
    end
  end

  def show(conn, %{"id" => id}) do
    product = CS.get_product!(id)
    render(conn, :show, product: product)
  end

  def update(conn, %{"id" => id, "product" => product_params}) do
    product = CS.get_product!(id)

    with {:ok, %Product{} = product} <- CS.update_product(product, product_params) do
      render(conn, :show, product: product)
    end
  end

  def delete(conn, %{"id" => id}) do
    product = CS.get_product!(id)

    with {:ok, %Product{}} <- CS.delete_product(product) do
      send_resp(conn, :no_content, "")
    end
  end
end
