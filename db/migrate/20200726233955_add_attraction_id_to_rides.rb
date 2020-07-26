class AddAttractionIdToRides < ActiveRecord::Migration[5.2]
  def change
    change_table :rides do |t|
      t.integer :attraction_id
      end
  end
end
