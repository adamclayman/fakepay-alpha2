FactoryBot.define do
  factory :valid_customer do
    name { Faker::Name.name }
    email { Faker::Internet.email}
    handle { Faker::Internet.username(8) }
    profile_address { Faker::Address.full_address }
    created_at { 5.days.ago }
    updated_at { 5.hours.ago }
  end

  factory :invalid_customer do
    name { Faker::Name.name }
    handle { Faker::Internet.username(8) }
    profile_address { Faker::Address.full_address }
    created_at { 5.days.ago }
    updated_at { 5.hours.ago }
  end
end