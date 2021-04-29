class CreateOrders < ActiveRecord::Migration[5.0]
  def change
    create_table :orders do |t|
      t.integer :customer_id
      t.string :postal_code
      t.string :address
      t.string :customer_name
      t.integer :shipping_fee
      t.integer :payment_amount
      t.integer :payment_method
      t.integer :status

      t.timestamps
    end
  end
end
