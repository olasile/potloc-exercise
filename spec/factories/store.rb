FactoryBot.define do
  factory :store do
    name { Faker::Company.name }

    trait :with_products do
      after(:create) do |store|
        create_list :product, 10, store: store
      end
    end
  end
end
