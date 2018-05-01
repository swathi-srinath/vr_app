class Order < ApplicationRecord
  has_many :order_items
  before_create :set_order_status
  before_save :update_sub_total, :update_total_cost

  def sub_total
    order_items.collect { |oi| oi.valid? ? (oi.quantity * oi.unit_price) : 0 }.sum
  end

  def update_sub_total
    self[:sub_total] = sub_total
  end

  def discount
    items_quantity = order_items.collect { |oi| oi.valid? ? (oi.quantity) : 0 }.sum 
    items_quantity > 20 ? 0.9 : 1.0
  end
  
  def update_discount
    self[:discount] = discount
  end
  
  def shipping_cost
    items_quantity = order_items.collect { |oi| oi.valid? ? (oi.quantity) : 0 }.sum
    items_quantity < 10 ? 30.0 : 0.0
  end

  def update_shipping_cost
    self[:shipping_cost] = shipping_cost
  end
        
  def update_total_cost
    self[:total_cost] = (sub_total * discount) + shipping_cost
  end
    

private
  def set_order_status
    self.order_status = "Open"
  end 
end
