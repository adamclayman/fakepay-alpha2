class Customer < ApplicationRecord
  has_many :subscriptions, dependent: :destroy
  validates :name, presence: true
end