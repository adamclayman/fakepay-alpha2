FactoryBot.define do
  factory :plan do
    name { Faker::Military.air_force_rank }
    price { Faker::Number.number(4)}
    period "Monthly"
  end
end