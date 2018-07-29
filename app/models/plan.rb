class Plan < ApplicationRecord
  has_many :subscriptions
  validates :name, presence: true
  validates :price, presence: true
  validates :period, presence: true
end