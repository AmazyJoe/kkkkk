defmodule ProductReview.CSFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `ProductReview.CS` context.
  """

  @doc """
  Generate a review.
  """
  def review_fixture(attrs \\ %{}) do
    {:ok, review} =
      attrs
      |> Enum.into(%{
        review: "some review"
      })
      |> ProductReview.CS.create_review()

    review
  end

  @doc """
  Generate a product.
  """
  def product_fixture(attrs \\ %{}) do
    {:ok, product} =
      attrs
      |> Enum.into(%{
        product_name: "some product_name",
        product_price: 42,
        product_review: "some product_review"
      })
      |> ProductReview.CS.create_product()

    product
  end

  @doc """
  Generate a user.
  """
  def user_fixture(attrs \\ %{}) do
    {:ok, user} =
      attrs
      |> Enum.into(%{
        email: "some email",
        first_name: "some first_name",
        last_name: "some last_name"
      })
      |> ProductReview.CS.create_user()

    user
  end
end
