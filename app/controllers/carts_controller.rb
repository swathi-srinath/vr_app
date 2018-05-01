class CartsController < ApplicationController
  def show
    @order_items = existing_order.order_items
    @order       = existing_order
  end
end

