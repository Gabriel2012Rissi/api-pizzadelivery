class OrderPizza < ActiveRecord::Base
  # Associations
  belongs_to :order
  belongs_to :pizza

  # Callbacks
  before_validation :set_subtotal

  # Validations
  validates :quantity, presence: true, numericality: { greater_than: 0 }

  private

  def set_subtotal
    self.subtotal = quantity * pizza.price
  end
end
