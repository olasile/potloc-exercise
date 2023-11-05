FactoryBot.define do
  factory :cart do
    trait :stale do
      updated_at { 3.days.ago }
    end

    trait :with_products do
      after(:create) do |cart|
        product = create(:product)
        create :cart_product, cart: cart, product: product, quantity: 1
      end
    end
  end
end
