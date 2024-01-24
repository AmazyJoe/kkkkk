defmodule ProductReview.Repo.Migrations.CreateProducts do
  use Ecto.Migration

  def change do
    create table(:products) do
      add :product_name, :string
      add :product_review, :string
      add :product_price, :integer

      timestamps(type: :utc_datetime)
    end
  end
end
