class OrdersController < ApplicationController
    before_action :set_order, only: %i[ show update destroy ]

  # GET /orders
  def index
    if params[:product_id]
      product= Product.find_by(id: params[:product_id])
      @orders= product.orders.where(user: current_user)
    elsif params[:contact_id]
      contact = Contact.find_by(id: params[:contact_id])
      @orders= contact.orders.where(user: current_user)
    else
      @orders = Order.where(user: current_user).order(PO_date: :desc)
    end
      render json: @orders
  end

  

  # GET /orders/1
  def show
    order = Order.find_by(id: params[:id])
    render json: @order
  end

  # POST /orders
  def create
    @order = Order.new(order_params)
    
    if @order.save
      render json: @order, status: :created, location: @order
    else
      render json: @order.errors, status: :unprocessable_entity

    # rescue ActiveRecord::RecordInvalid => e
    #   render json: { errors: e.record.errors.full_messages }, status: :unprocessable_entity
    end 
  end

  # PATCH/PUT /orders/1
  def update
    if @order.update(order_params)
      render json: @order
    else
      render json: @order.errors, status: :unprocessable_entity
    end
  end

  # DELETE /orders/1
  def destroy
    @order.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_order
      @order = Order.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def order_params
      params.require(:order).permit(:PO, :cases, :kilos, :price_kg, :price_total, :product_id, :contact_id, :payment_id, :packing_id, :port_from, :port_to, :selected_size, :selected_freeze, :selected_glaze, :shipment_date, :catching_method, :specifications, :total_kilos, :order_status, :order_ref_number, :PO_date, :user_id)
    end
end
