class Plan < ApplicationRecord
  validates :name, presence: true
  validates :price, presence: true
  validates :period, presence: true
end