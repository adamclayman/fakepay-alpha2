require 'rails_helper'

RSpec.describe Subscription, type: :model do
	let(:customer) { Customer.create!(name: "Joel Clayman", handle: "joelclayman", email: "joel@clayman.org", profile_address: "Boca Raton, FL")}
	let(:plan) {Plan.create!(name: "Bronze Box", price: "1999", period: "Monthly")}

  it 'should not validate subscriptions without a customer reference' do
    @subscription = FactoryBot.build(:valid_subscription, customer: "")
    expect(@subscription).to_not be_valid
  end
  it 'should not validate subscriptions without a plan reference' do
    @subscription = FactoryBot.build(:valid_subscription, plan: "")
    expect(@subscription).to_not be_valid
  end
  it 'should not validate subscriptions without a plan name' do
    @subscription = FactoryBot.build(:valid_subscription, plan_name: "")
    expect(@subscription).to_not be_valid
  end
  it 'should not validate subscriptions without a plan price' do
    @subscription = FactoryBot.build(:valid_subscription, plan_price: "")
    expect(@subscription).to_not be_valid
  end
  it 'should not validate subscriptions without a plan period' do
    @subscription = FactoryBot.build(:valid_subscription, plan_period: "")
    expect(@subscription).to_not be_valid
  end
  it 'should not validate subscriptions without a shipping address' do
    @subscription = FactoryBot.build(:valid_subscription, shipping_address: "")
    expect(@subscription).to_not be_valid
  end
  it 'should not validate subscriptions without a subscribe date' do
    @subscription = FactoryBot.build(:valid_subscription, subscribe_date: "")
    expect(@subscription).to_not be_valid
  end
  it 'should not validate subscriptions without a payment token' do
    @subscription = FactoryBot.build(:valid_subscription, payment_token: "")
    expect(@subscription).to_not be_valid
  end
end