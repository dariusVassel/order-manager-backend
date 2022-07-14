class ItemsController < ApplicationController
    def index
        if params[:product_id]
          product= Product.find_by(id: params[:product_id])
          @items= product.orders.where(user: current_user)
        elsif params[:contact_id]
          contact = Contact.find_by(id: params[:contact_id])
          @items= contact.orders.where(user: current_user)
        else
          @items = Item.all
    
          # @orders = Order.where(user: current_user).order(PO_date: :desc)
        end
          render json: @items
    end
end
