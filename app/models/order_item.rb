class OrderItem < ApplicationRecord
  belongs_to :product, touch: true
  belongs_to :order, touch: true 

  validates :quantity, presence: true, numericality: {greater_than: 0}

  before_save :finalize
  def unit_price
    product.base_price
  end

  def total_price
    unit_price * quantity
  end

  private
  
  def finalize
    self[:unit_price]  = unit_price
    self[:total_price] = quantity * self[:unit_price]
  end
 
end
