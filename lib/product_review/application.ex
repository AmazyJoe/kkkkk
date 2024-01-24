defmodule ProductReview.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      ProductReviewWeb.Telemetry,
      ProductReview.Repo,
      {DNSCluster, query: Application.get_env(:product_review, :dns_cluster_query) || :ignore},
      {Phoenix.PubSub, name: ProductReview.PubSub},
      # Start the Finch HTTP client for sending emails
      {Finch, name: ProductReview.Finch},
      # Start a worker by calling: ProductReview.Worker.start_link(arg)
      # {ProductReview.Worker, arg},
      # Start to serve requests, typically the last entry
      ProductReviewWeb.Endpoint
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: ProductReview.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    ProductReviewWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
