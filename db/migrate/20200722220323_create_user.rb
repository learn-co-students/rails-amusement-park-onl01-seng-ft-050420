class CreateUser < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |f| 
      f.string :name 
      f.string :password_digest 
      f.integer :nausea 
      f.integer :happiness 
      f.integer :tickets 
      f.integer :height 
    end 
  end
end
