class Attraction < ApplicationRecord
    # t.string "name"
    # t.integer "happiness_rating"
    # t.integer "nausea_rating"
    # t.integer "min_height"
    # t.integer "tickets"
    has_many :rides
    has_many :users, through: :rides
end
