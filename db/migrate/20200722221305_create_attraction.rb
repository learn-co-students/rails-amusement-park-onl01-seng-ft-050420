class CreateAttraction < ActiveRecord::Migration[5.2]
  def change
    create_table :attractions do |f| 
      f.string :name 
      f.integer :nausea_rating 
      f.integer :happiness_rating 
      f.integer :tickets 
      f.integer :min_height 
    end 
  end
end
