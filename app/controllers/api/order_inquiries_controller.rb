class Api::OrderInquiriesController < ApplicationController
    before_action :set_order_inquiry, only: %i[ show update destroy ]

      # GET /order_inquiries
  def index
      @order_inquiries = OrderInquiry.where(user: current_user)
      # @orders = Order.where(user: current_user).order(PO_date: :desc)

      render json: @order_inquiries
  end

  # POST /order_inquiries
  def create
    #binding.pry
    @order_inquiry = OrderInquiry.new(order_inquiry_params)
    
    if @order_inquiry.save
      render json: @order_inquiry, status: :created, location: api_order_inquiries_path(@order_inquiry)
    else
      render json: @order_inquiry.errors, status: :unprocessable_entity

    # rescue ActiveRecord::RecordInvalid => e
    #   render json: { errors: e.record.errors.full_messages }, status: :unprocessable_entity
    end 
  end

  # PATCH/PUT /order_inquiries/1
  def update
    respond_to do |format|
      if @order_inquiry.update(order_inquiry_params)&& @order_inquiry.status == "EDITED"
          format.json {render json: {order_inquiry: @order_inquiry, user: current_user}, status: :created, location: api_order_inquiries_path(@order_inquiry)}
      elsif @order_inquiry.update(order_inquiry_params)&& @order_inquiry.status == "SENT"
        OrderInquiryMailer.with(order_inquiry: order_inquiry_params).send_inquiry.deliver_later
        format.html { redirect_to(@order_inquiry, notice: 'Order was successfully sent.') }
        format.json {render json: {order_inquiry: @order_inquiry, user: current_user}, status: :created, location: api_order_inquiries_path(@order_inquiry)}
      else
        format.html { render action: 'new' }
        format.json {render json: {errors: ["Unable to send"]}, status: :unprocessable_entity}
      end
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
      params.require(:order_inquiry).permit(:item_id, :product_name, :quantity, :packing, :glaze, :shipment_date, :contact_name, :user_id, :contact_id, :order_item_id, :status)
    end
end
