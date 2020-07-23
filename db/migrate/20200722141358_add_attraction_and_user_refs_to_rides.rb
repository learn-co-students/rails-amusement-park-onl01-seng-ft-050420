class AddAttractionAndUserRefsToRides < ActiveRecord::Migration[5.2]
  def change
    add_reference :rides, :user, foreign_key: true
    add_reference :rides, :attraction, foreign_key: true
  end
end
