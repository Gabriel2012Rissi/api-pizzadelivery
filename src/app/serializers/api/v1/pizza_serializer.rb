module Api
  module V1
    class PizzaSerializer < BaseSerializer
      def type
        'pizzas'
      end

      attributes :name, :description, :code, :price, :created_at

      attribute :price do
        object.price_formatted
      end

      attribute :created_at do
        object.created_at_formatted
      end
    end
  end
end
