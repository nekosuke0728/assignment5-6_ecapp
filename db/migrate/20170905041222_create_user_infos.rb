class CreateUserInfos < ActiveRecord::Migration[5.1]
  def change
    create_table :user_infos do |t|
      t.integer :user_id
      t.string :firstname, null: false, default: ""
      t.string :lastname, null: false, default: ""
      t.string :zipcode, null: false, default: ""
      t.integer :prefecture, null: false
      t.string :city, null: false, default: ""
      t.string :block, null: false, default: ""
      t.string :building
      t.string :phone, null: false, default: ""

      t.timestamps
    end
  end
end
