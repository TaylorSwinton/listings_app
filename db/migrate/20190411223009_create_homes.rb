class CreateHomes < ActiveRecord::Migration
  def change
    create_table :homes do |t|
      t.string :home_address
      t.integer :bedroom
      t.integer :bathroom
      t.string :price
      t.text :description
      t.integer :user_id

      t.timestamps null: false
    end
  end
end
