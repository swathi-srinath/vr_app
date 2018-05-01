class AddDiscountToOrder < ActiveRecord::Migration[5.2]
  def change
    add_column :orders, :discount, :float
  end
end
