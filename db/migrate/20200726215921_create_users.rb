class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :name
      t.integer :height
      t.integer :nausea
      t.integer :tickets
      t.integer :happiness
      t.string :password
      t.boolean :admin, :default => false

      t.timestamps
    end
  end
end
