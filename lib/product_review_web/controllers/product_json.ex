defmodule ProductReviewWeb.ProductJSON do
  alias ProductReview.CS.Product

  @doc """
  Renders a list of products.
  """
  def index(%{products: products}) do
    %{data: for(product <- products, do: data(product))}
  end

  @doc """
  Renders a single product.
  """
  def show(%{product: product}) do
    %{data: data(product)}
  end

  defp data(%Product{} = product) do
    %{
      id: product.id,
      product_name: product.product_name,
      product_review: product.product_review,
      product_price: product.product_price
    }
  end
end
