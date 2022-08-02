class Api::OrderItemsController < ApplicationController
    def index
        @order_items = OrderItem.all

        render json: @order_items, :include => [:item]
        
      end
end
