FactoryBot.define do
  factory :subscription do
    customer nil
    plan nil
    plan_name "MyString"
    plan_price "MyString"
    plan_period "MyString"
    subscribe_date "2018-07-28"
    expiration_date "2018-07-28"
    shipping_address "MyString"
    payment_token "MyString"
  end
end
