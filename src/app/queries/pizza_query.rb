class PizzaQuery
  module Scopes
    def by_name(name)
      return self if name.blank?
      where(name: name)
    end

    def by_code(code)
      return self if code.blank?
      where(code: code)
    end

    def by_price(price)
      return self if price.blank?
      where(price: price)
    end
  end

  def self.call(filters)
    Pizza.extending(Scopes)
          .by_name(filters[:name])
          .by_code(filters[:code])
          .by_price(filters[:price])
  end
end
