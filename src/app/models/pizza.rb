class Pizza < ApplicationRecord
  # Validations
  validates :name, presence: true
  validates :description, presence: true
  validates :code, presence: true, uniqueness: true
  validates :price, presence: true, numericality: { greater_than_or_equal_to: 0 }
end
