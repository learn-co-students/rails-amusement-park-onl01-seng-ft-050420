class Attraction < ApplicationRecord
    has_many :rides 
    has_many :users, through: :rides 
end

# attraction.rides.build(user_id: user_id )
