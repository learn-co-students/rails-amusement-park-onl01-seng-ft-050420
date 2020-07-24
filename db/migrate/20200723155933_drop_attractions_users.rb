class DropAttractionsUsers < ActiveRecord::Migration[5.2]
  def change
    drop_table :attractions_users
  end
end
