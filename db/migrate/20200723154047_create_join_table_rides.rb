class CreateJoinTableRides < ActiveRecord::Migration[5.2]
  def change
    create_join_table :users, :attractions do |t|
      # t.index [:user_id, :attraction_id]
      # t.index [:attraction_id, :user_id]
    end
  end
end
