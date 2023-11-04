class OrderProduct < ApplicationRecord
  belongs_to :order
  belongs_to :product

  validates :quantity, numericality: { greater_than_or_equal_to: 1 }

  after_create :update_product_inventory

  def update_product_inventory
    product.update(available: product.available - quantity)
  end
end