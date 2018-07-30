FactoryBot.define do
  factory :valid_subscription do
    customer
    plan
    plan_name "Silver Box"
    plan_price "4900"
    plan_period "Monthly"
    subscribe_date Date.today
    expiration_date 1.year.from_now
    shipping_address {Faker::Address.full_address}
    payment_token "FAKE_PAYMENT_TOKEN_abcdefghijklmnop"
  end
  factory :invalid_subscription do
    customer
    plan
    plan_name "Silver Box"
    plan_price "Silver Box"

    subscribe_date Date.today
    expiration_date 1.year.from_now
    shipping_address {Faker::Address.full_address}
    payment_token "FAKE_PAYMENT_TOKEN_abcdefghijklmnop"
  end
end