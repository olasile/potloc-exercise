FactoryBot.define do
  factory :cart do
    trait :stale do
      updated_at { 3.days.ago }
    end
  end
end
