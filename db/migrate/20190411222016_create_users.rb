class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.string :email
      t.string :password_digest #in order to encrypt
      t.integer :phone_number
      t.string :base_address
    end
  end
end
