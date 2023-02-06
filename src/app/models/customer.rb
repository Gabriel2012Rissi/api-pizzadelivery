class Customer < ActiveRecord::Base
  # Associations
  has_many :orders

  # Validations
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :phone, presence: true,
  format: { 
    with: /\A\(\d{2}\)\d{5}-\d{4}\z/, 
    message: "must be in the format (99)99999-9999"
  }
  validates :address, presence: true
end
