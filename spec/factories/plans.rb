FactoryBot.define do
  factory :valid_plan, :class => Plan do
    name { Faker::Military.air_force_rank }
    price { Faker::Number.number(4)}
    period "Monthly"
  end

  factory :invalid_plan, :class => Plan do
    name { Faker::Military.air_force_rank }
    price { Faker::Number.number(4)}
    period { Faker::Number.number(10) }
  end
end