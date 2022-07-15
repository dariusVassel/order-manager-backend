class OrderInquiriesController < ApplicationController
    before_action :set_order_inquiry, only: %i[ show update destroy ]

      # GET /order_inquiries
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

  # POST /order_inquiries
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

  # GET /orders/1
  def show
    order_inquiry = OrderInquiry.find_by(id: params[:id])
    render json: @order_inquiry
  end

  # DELETE /order_inquiries/1
  def destroy
    @order_inquiry.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_order_inquiry
      @order_inquiry = OrderInquiry.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def order_inquiry_params
      params.require(:order_inquiry).permit(:item_id, :product_name, :quantity, :packing, :glaze, :shipment_date, :contact_name, :user_id, :contact_id, :order_item_id)
    end
end
