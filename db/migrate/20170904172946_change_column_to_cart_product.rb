class ChangeColumnToCartProduct < ActiveRecord::Migration[5.1]
  def change
    change_column :cart_products, :status, :boolean, null: false, default: true
  end
end
