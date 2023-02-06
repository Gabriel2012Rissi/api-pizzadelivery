class PizzaDecorator < ApplicationDecorator
  delegate_all

  def price_formatted
    humanize_money(self.price)
  end

  def created_at_formatted
    humanize_date_time(self.created_at)
  end
end
