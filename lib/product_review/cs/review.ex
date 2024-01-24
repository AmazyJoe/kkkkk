defmodule ProductReview.CS.Review do
  use Ecto.Schema
  import Ecto.Changeset

  schema "reviews" do
    field :review, :string
    field :user_id, :id
    field :product_id, :id

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(review, attrs) do
    review
    |> cast(attrs, [:review])
    |> validate_required([:review])
  end
end
