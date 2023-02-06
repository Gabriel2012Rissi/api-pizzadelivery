module Api
  module V1
    class PizzasController < ApplicationController
      before_action :set_pizza, only: [:show]

      def index
        @pizzas = PizzaDecorator.decorate_collection(PizzaQuery.call(params))
        
        render json: JSONAPI::Serializer.serialize(
          @pizzas,
          is_collection: true,
          namespace: Api::V1,
          serializer: PizzaSerializer
        ).to_json
      end

      def show
        render json: JSONAPI::Serializer.serialize(
          @pizza, 
          namespace: Api::V1,
          serializer: PizzaSerializer
        ).to_json
      end

      private
        
      def set_pizza
        @pizza = PizzaDecorator.decorate(Pizza.find(params[:id]))
      end
    end
  end
end
