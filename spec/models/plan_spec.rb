require 'rails_helper'

RSpec.describe Plan, type: :model do
  it 'should not validate plans without a name' do
    @plan = FactoryBot.build(:valid_plan, name: "")
    expect(@plan).to_not be_valid
  end
  it 'should not validate plans without a price' do
    @plan = FactoryBot.build(:valid_plan, price: "")
    expect(@plan).to_not be_valid
  end
  it 'should not validate plans with a decimalized price' do
    @plan = FactoryBot.build(:valid_plan, price: "99.00")
    expect(@plan).to_not be_valid
  end
  it 'should not validate plans without a period' do
    @plan = FactoryBot.build(:valid_plan, period: "")
    expect(@plan).to_not be_valid
  end
end