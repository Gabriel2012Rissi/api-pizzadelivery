class OrderDecorator < ApplicationDecorator
  delegate_all

  decorates_association :customer
  decorates_association :order_pizzas

  def customer_name
    object.customer.decorate.full_name
  end

  def total_formatted
    humanize_money(object.total)
  end

  def created_at_formatted
    humanize_date_time(object.created_at)
  end
end
