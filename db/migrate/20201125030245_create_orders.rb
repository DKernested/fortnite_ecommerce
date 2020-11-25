class CreateOrders < ActiveRecord::Migration[6.0]
  def change
    create_table :orders do |t|
      t.string :payment_id
      t.integer :cosmetic_id
      t.integer :customer_id
      t.integer :province_id
      t.integer :cosmetic_cost
      t.integer :tax_cost
      t.integer :total_cost
      t.string :order_status
      t.timestamps
    end
  end
end
