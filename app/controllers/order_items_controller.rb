class OrderItemsController < ApplicationController
    def index
        @order_items = Order.all
        @order_items.to_json(include: item) 
      end
end
