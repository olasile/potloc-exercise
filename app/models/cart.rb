class Cart < ApplicationRecord
  has_many :cart_products, dependent: :destroy

  scope :stale, -> { where('updated_at < ?', 12.hours.ago) }
end