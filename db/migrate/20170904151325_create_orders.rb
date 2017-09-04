class CreateOrders < ActiveRecord::Migration[5.1]
  def change
    create_table :orders do |t|
      t.integer :user_id
      t.integer :total_price
      t.integer :payment_method

      t.timestamps
    end
  end
end
