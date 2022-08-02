class OrdersController < ApplicationController
    before_action :set_order, only: %i[ show update destroy ]

  # GET /orders
  def index
      @orders = Order.all
      #@orders = Order.where(user: current_user)
    
    render json: @orders, :include => [:order_item =>:item]
    
    #:include => [:order_item => [:include => [:item]]]

    
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
      params.require(:order).permit(:po_number, :po_date, :internal_ref_number, :size, :glaze, :price_kg, :cartons, :packing, :kgs_carton, :packing_specs, :shipment_date, :payment_terms, :port_to, :port_from, :order_total, :freeze, :total_kilos, :order_status, :buyer_id, :seller_id, :order_item_id)
    end
end
