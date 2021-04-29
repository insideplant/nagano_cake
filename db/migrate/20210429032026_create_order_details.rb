class CreateOrderDetails < ActiveRecord::Migration[5.0]
  def change
    create_table :order_details do |t|
      t.integer :customer_id
      t.integer :order_id
      t.integer :price
      t.integer :amount
      t.integer :is_active

      t.timestamps
    end
  end
end
