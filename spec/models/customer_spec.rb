require 'rails_helper'

RSpec.describe Customer, type: :model do
  it 'should not validate customers without a name' do
    @customer = FactoryBot.build(:valid_customer, name: "")
    expect(@customer).to_not be_valid
  end
end