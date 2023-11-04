FactoryBot.define do
  factory :cart_product do
    quantity { 1 }
    cart
    product
  end
end
