defmodule ProductReview.CS.Product do
  use Ecto.Schema
  import Ecto.Changeset

  schema "products" do
    field :product_review, :string
    field :product_name, :string
    field :product_price, :integer

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(product, attrs) do
    product
    |> cast(attrs, [:product_name, :product_review, :product_price])
    |> validate_required([:product_name, :product_review, :product_price])
  end
end
