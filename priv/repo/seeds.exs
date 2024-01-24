# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     ProductReview.Repo.insert!(%ProductReview.SomeSchema{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.
alias ProductReview.Repo
alias ProductReview.Review
alias ProductReview.Product
alias ProductReview.User

# Create sample users
user1 = Repo.insert!(%User{
  first_name: "John",
  last_name: "Doe",
  email: "john.doe@example.com"
})

user2 = Repo.insert!(%User{
  first_name: "Jane",
  last_name: "Doe",
  email: "jane.doe@example.com"
})

# Create sample products
product1 = Repo.insert!(%Product{
  product_name: "Elixir Programming Book",
  product_review: "Excellent book for beginners",
  product_price: 5000
})

product2 = Repo.insert!(%Product{
  product_name: "Phoenix Framework Guide",
  product_review: "Great resource for learning Phoenix",
  product_price: 6000
})

# Create sample reviews
Repo.insert!(%Review{
  review: "Very helpful and easy to understand",
  user_id: user1.id,
  product_id: product1.id
})

Repo.insert!(%Review{
  review: "A must-read for aspiring Phoenix developers",
  user_id: user2.id,
  product_id: product2.id
})

