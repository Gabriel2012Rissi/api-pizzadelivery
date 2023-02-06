class OrderPizzaDecorator < ApplicationDecorator
  delegate_all

  decorates_association :order
  decorates_association :pizza

  def subtotal_formatted
    humanize_money(object.subtotal)
  end
end
