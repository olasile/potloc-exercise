FactoryBot.define do
  factory :order do
    created_at { DateTime.now }
    trait :with_order_products do
      after(:create) do |order|
        create :order_product, order: order, quantity: 1
      end
    end
  end
end
