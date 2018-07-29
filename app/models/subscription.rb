class Subscription < ApplicationRecord
  belongs_to :customer
  belongs_to :plan
  validates :customer_id, presence: true
  validates :plan_id, presence: true
  validates :plan_name, presence: true
  validates :plan_price, presence: true
  validates :plan_period, presence: true
  validates :shipping_address, presence: true
  validates :subscribe_date, presence: true
  validates :payment_token, presence: true

  def save
    super
  end

end
