class CartCleanupJob < ApplicationJob
  queue_as :cart_cleanup

  def perform
    Cart.stale.in_batches.destroy_all
  end
end