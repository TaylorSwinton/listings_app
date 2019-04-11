class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.string :email
      t.string :password_digest #in order to encrypt
      t.string :phone_number
      t.string :base_address

      t.timestamps null: false
    end
  end
end
