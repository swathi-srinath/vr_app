class OrderItemsController < ApplicationController

  # POST /order_items
  # POST /order_items.json
  def create
    @order         = existing_order
    @existing_item = @order.order_items.find_by(product_id: params[:order_item][:product_id])
    p @existing_item 
    if @existing_item
      @existing_item.quantity += order_item_params[:quantity]
      @existing_item.save!
      @order.update_total_cost
      session[:order_id] = @existing_item.order_id
    else
      @order_item = @order.order_items.new(order_item_params)
      @order_item.save!
      @order.update_total_cost
      session[:order_id] = @order.id
     end
  end
  
  def update
    @order      = existing_order
    @order_item = @order.order_items.find(params[:id])
    @order_item.update_attributes(order_item_params)
    @order_items = @order.order_items
    @order.update_total_cost
  end

  def destroy
    @order      = existing_order
    @order_item = @order.order_items.find(params[:id])
    @order_item.destroy
    @order_items = @order.order_items
    @order.update_total_cost
    if @order.order_items.size < 1
      @order.destroy
      session[:order_id] = nil
      redirect_to root_path
    end
  end
  private

    # Never trust parameters from the scary internet, only allow the white list through.
    def order_item_params
      params.require(:order_item).permit(:quantity,:product_id)
    end
end
