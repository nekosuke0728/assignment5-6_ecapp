class AddDestinationToOrders < ActiveRecord::Migration[5.1]
  def change
    add_column :orders, :firstname, :string, null: false, default: ""
    add_column :orders, :lastname, :string, null: false, default: ""
    add_column :orders, :zipcode, :string, null: false, default: ""
    add_column :orders, :prefecture, :integer, null: false,  default: 0
    add_column :orders, :city, :string, null: false, default: ""
    add_column :orders, :block, :string, null: false, default: ""
    add_column :orders, :building, :string
    add_column :orders, :phone, :string, null: false, default: ""
  end
end

