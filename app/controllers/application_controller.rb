class ApplicationController < ActionController::Base

  protect_from_forgery with: :exception
  
  def existing_order
    if !session[:order_id].nil?
      Order.find(session[:order_id])
    else
      Order.new
    end
  end
  
  def existing_order_items
    if !session[:order_id].nil?
      order = Order.find(session[:order_id])
      order.order_items.map{ |oi| oi.valid? ? (oi.quantity) : 0}.sum
    else
      0
    end
  end
  
end
