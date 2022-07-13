class OrderInquiriesController < ApplicationController
    before_action :set_user, only: %i[ show update destroy ]

      # GET /orders
  def index
    if params[:product_id]
      product= Product.find_by(id: params[:product_id])
      @order_inquiries= product.orders.where(user: current_user)
    elsif params[:contact_id]
      contact = Contact.find_by(id: params[:contact_id])
      @order_inquiries= contact.orders.where(user: current_user)
    else
      @order_inquiries = OrderInquiry.all

      # @orders = Order.where(user: current_user).order(PO_date: :desc)
    end
      render json: @order_inquiries
  end

  # POST /orders
  def create
    @order_inquiry = OrderInquiry.new(order_inquiry_params)
    
    if @order_inquiry.save
      render json: @order_inquiry, status: :created, location: @order_inquiry
    else
      render json: @order_inquiry.errors, status: :unprocessable_entity

    # rescue ActiveRecord::RecordInvalid => e
    #   render json: { errors: e.record.errors.full_messages }, status: :unprocessable_entity
    end 
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_order
      @order = Order.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def order_inquiry_params
      params.require(:order_inquiry).permit(:item_id, :product_name, :quantity, :packing, :glaze, :shipment_date, :contact_name)
    end
end
