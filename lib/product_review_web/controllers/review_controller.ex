defmodule ProductReviewWeb.ReviewController do
  use ProductReviewWeb, :controller

  alias ProductReview.CS
  alias ProductReview.CS.Review

  action_fallback ProductReviewWeb.FallbackController

  def index(conn, _params) do
    reviews = CS.list_reviews()
    render(conn, :index, reviews: reviews)
  end

  def create(conn, %{"review" => review_params}) do
    with {:ok, %Review{} = review} <- CS.create_review(review_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", ~p"/api/reviews/#{review}")
      |> render(:show, review: review)
    end
  end

  def show(conn, %{"id" => id}) do
    review = CS.get_review!(id)
    render(conn, :show, review: review)
  end

  def update(conn, %{"id" => id, "review" => review_params}) do
    review = CS.get_review!(id)

    with {:ok, %Review{} = review} <- CS.update_review(review, review_params) do
      render(conn, :show, review: review)
    end
  end

  def delete(conn, %{"id" => id}) do
    review = CS.get_review!(id)

    with {:ok, %Review{}} <- CS.delete_review(review) do
      send_resp(conn, :no_content, "")
    end
  end
end
