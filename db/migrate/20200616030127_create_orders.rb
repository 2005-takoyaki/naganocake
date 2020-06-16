class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|
      t.integer :customer_id, null: false
      t.integer :fare, null: false
      t.integer :billing_total, null: false
      t.integer :payment_method, null: false
      t.integer :order_status, null: false
      t.string :postal_code, null: false
      t.string :address, null: false
      t.string :address_name, null: false

      t.timestamps
    end
  end
end
