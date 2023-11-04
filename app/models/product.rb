class Product < ApplicationRecord
  belongs_to :store

  validates :name, presence: true
  validates :available, numericality: { greater_than_or_equal_to: 0 }
end