FactoryBot.define do
  factory :customer do
    name { Faker::Name.name }
    handle { Faker::Internet.username(8) }
    profile_address { Faker::Address.full_address }
    created_at { 5.days.ago }
    updated_at { 5.hours.ago }
  end
end
