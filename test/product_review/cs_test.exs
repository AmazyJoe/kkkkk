defmodule ProductReview.CSTest do
  use ProductReview.DataCase

  alias ProductReview.CS

  describe "reviews" do
    alias ProductReview.CS.Review

    import ProductReview.CSFixtures

    @invalid_attrs %{review: nil}

    test "list_reviews/0 returns all reviews" do
      review = review_fixture()
      assert CS.list_reviews() == [review]
    end

    test "get_review!/1 returns the review with given id" do
      review = review_fixture()
      assert CS.get_review!(review.id) == review
    end

    test "create_review/1 with valid data creates a review" do
      valid_attrs = %{review: "some review"}

      assert {:ok, %Review{} = review} = CS.create_review(valid_attrs)
      assert review.review == "some review"
    end

    test "create_review/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = CS.create_review(@invalid_attrs)
    end

    test "update_review/2 with valid data updates the review" do
      review = review_fixture()
      update_attrs = %{review: "some updated review"}

      assert {:ok, %Review{} = review} = CS.update_review(review, update_attrs)
      assert review.review == "some updated review"
    end

    test "update_review/2 with invalid data returns error changeset" do
      review = review_fixture()
      assert {:error, %Ecto.Changeset{}} = CS.update_review(review, @invalid_attrs)
      assert review == CS.get_review!(review.id)
    end

    test "delete_review/1 deletes the review" do
      review = review_fixture()
      assert {:ok, %Review{}} = CS.delete_review(review)
      assert_raise Ecto.NoResultsError, fn -> CS.get_review!(review.id) end
    end

    test "change_review/1 returns a review changeset" do
      review = review_fixture()
      assert %Ecto.Changeset{} = CS.change_review(review)
    end
  end

  describe "products" do
    alias ProductReview.CS.Product

    import ProductReview.CSFixtures

    @invalid_attrs %{product_review: nil, product_name: nil, product_price: nil}

    test "list_products/0 returns all products" do
      product = product_fixture()
      assert CS.list_products() == [product]
    end

    test "get_product!/1 returns the product with given id" do
      product = product_fixture()
      assert CS.get_product!(product.id) == product
    end

    test "create_product/1 with valid data creates a product" do
      valid_attrs = %{product_review: "some product_review", product_name: "some product_name", product_price: 42}

      assert {:ok, %Product{} = product} = CS.create_product(valid_attrs)
      assert product.product_review == "some product_review"
      assert product.product_name == "some product_name"
      assert product.product_price == 42
    end

    test "create_product/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = CS.create_product(@invalid_attrs)
    end

    test "update_product/2 with valid data updates the product" do
      product = product_fixture()
      update_attrs = %{product_review: "some updated product_review", product_name: "some updated product_name", product_price: 43}

      assert {:ok, %Product{} = product} = CS.update_product(product, update_attrs)
      assert product.product_review == "some updated product_review"
      assert product.product_name == "some updated product_name"
      assert product.product_price == 43
    end

    test "update_product/2 with invalid data returns error changeset" do
      product = product_fixture()
      assert {:error, %Ecto.Changeset{}} = CS.update_product(product, @invalid_attrs)
      assert product == CS.get_product!(product.id)
    end

    test "delete_product/1 deletes the product" do
      product = product_fixture()
      assert {:ok, %Product{}} = CS.delete_product(product)
      assert_raise Ecto.NoResultsError, fn -> CS.get_product!(product.id) end
    end

    test "change_product/1 returns a product changeset" do
      product = product_fixture()
      assert %Ecto.Changeset{} = CS.change_product(product)
    end
  end

  describe "users" do
    alias ProductReview.CS.User

    import ProductReview.CSFixtures

    @invalid_attrs %{first_name: nil, last_name: nil, email: nil}

    test "list_users/0 returns all users" do
      user = user_fixture()
      assert CS.list_users() == [user]
    end

    test "get_user!/1 returns the user with given id" do
      user = user_fixture()
      assert CS.get_user!(user.id) == user
    end

    test "create_user/1 with valid data creates a user" do
      valid_attrs = %{first_name: "some first_name", last_name: "some last_name", email: "some email"}

      assert {:ok, %User{} = user} = CS.create_user(valid_attrs)
      assert user.first_name == "some first_name"
      assert user.last_name == "some last_name"
      assert user.email == "some email"
    end

    test "create_user/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = CS.create_user(@invalid_attrs)
    end

    test "update_user/2 with valid data updates the user" do
      user = user_fixture()
      update_attrs = %{first_name: "some updated first_name", last_name: "some updated last_name", email: "some updated email"}

      assert {:ok, %User{} = user} = CS.update_user(user, update_attrs)
      assert user.first_name == "some updated first_name"
      assert user.last_name == "some updated last_name"
      assert user.email == "some updated email"
    end

    test "update_user/2 with invalid data returns error changeset" do
      user = user_fixture()
      assert {:error, %Ecto.Changeset{}} = CS.update_user(user, @invalid_attrs)
      assert user == CS.get_user!(user.id)
    end

    test "delete_user/1 deletes the user" do
      user = user_fixture()
      assert {:ok, %User{}} = CS.delete_user(user)
      assert_raise Ecto.NoResultsError, fn -> CS.get_user!(user.id) end
    end

    test "change_user/1 returns a user changeset" do
      user = user_fixture()
      assert %Ecto.Changeset{} = CS.change_user(user)
    end
  end
end
