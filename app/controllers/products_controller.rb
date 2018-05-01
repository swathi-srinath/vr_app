class ProductsController < ApplicationController

  # GET /products
  # GET /products.json
  def index
    @products   = Product.all
  end

  # GET /products/1
  # GET /products/1.json
  def show
    @product   = Product.find(params[:id])
    @order_item = existing_order.order_items.new
  end
end
