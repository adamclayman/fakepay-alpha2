FactoryBot.define do
  factory :valid_plan do
    name { Faker::Military.air_force_rank }
    price { Faker::Number.number(4)}
    period "Monthly"
  end

  factory :invalid_plan do
    name { Faker::Military.air_force_rank }
    price { Faker::Number.number(4)}
    period { Faker::Number.number(10) }}
  end
end