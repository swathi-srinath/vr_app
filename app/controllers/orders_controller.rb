class OrdersController < ApplicationController
  before_action :set_order, only: [:show, :update, :destroy]

  def checkout
    @order = existing_order
  end
  
  def update
    
    @order.update(order_params)
    session[:order_id] = nil
    redirect_to root_path
  end
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_order
      @order = Order.find(session[:order_id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def order_params
      params.require(:order).permit(:sub_total, :shipping_cost, :discount, :total_cost, :customer_name, :address, :phone, :email)
    end
end
