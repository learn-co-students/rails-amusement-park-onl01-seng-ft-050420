class Ride < ApplicationRecord
    validates :attraction_id, presence: true
    belongs_to :user
    belongs_to :attraction
end
