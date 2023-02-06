class Order < ActiveRecord::Base
  # Associations
  has_many :order_pizzas
  has_many :pizzas, through: :order_pizzas
  belongs_to :customer

  # Callbacks
  before_save :set_total

  # Enums
  enum status: { on_process: 0, delivered: 1, canceled: 2 }

  # Nested attributes
  accepts_nested_attributes_for :order_pizzas, allow_destroy: true

  # Validations
  validates :customer_id, presence: true
  validates :status, presence: true

  private

  def set_total
    self.total = order_pizzas.map(&:subtotal).sum
  end
end
