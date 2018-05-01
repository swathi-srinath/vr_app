class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|
      t.float :sub_total
      t.float :shipping_cost
      t.float :total_cost
      t.string :order_status
      t.string :customer_name
      t.string :string
      t.string :address
      t.string :phone
      t.string :email

      t.timestamps
    end
  end
end
