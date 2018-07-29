FactoryBot.define do
  factory :subscription do
    customer Customer.find(2)
    plan Plan.find(2)
    plan_name "Silver Box"
    plan_price "4900"
    plan_period "Monthly"
    subscribe_date Date.today
    expiration_date 1.year.from_now
    shipping_address {Faker::Address.full_address}
    payment_token "FAKE_PAYMENT_TOKEN_abcdefghijklmnop"
  end
end