defmodule ProductReview.Repo do
  use Ecto.Repo,
    otp_app: :product_review,
    adapter: Ecto.Adapters.Postgres
end
