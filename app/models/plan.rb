class Plan < ApplicationRecord
  has_many :subscriptions
  validates :name, presence: true
  validates :price, presence: true, numericality: { only_integer: true }
  validates :period, presence: true
end