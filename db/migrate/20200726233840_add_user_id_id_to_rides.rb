class AddUserIdIdToRides < ActiveRecord::Migration[5.2]
  def change
    change_table :rides do |t|
      t.integer :user_id
      end
  end
end
