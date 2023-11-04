FactoryBot.define do
  factory :product do
    name { Faker::Commerce.product_name }
    available { 100 }
    store
  end
end
