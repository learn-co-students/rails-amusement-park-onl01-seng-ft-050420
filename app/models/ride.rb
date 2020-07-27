class Ride < ApplicationRecord
    validates :attraction_id, presence: true
    belongs_to :user
    belongs_to :attraction

    def take_ride
        msg = ['Sorry.']

        if self.user.tickets < self.attraction.tickets
            msg << "You do not have enough tickets to ride the #{self.attraction.name}."
        end

        if self.user.height < self.attraction.min_height
            msg << "You are not tall enough to ride the #{self.attraction.name}."
        end

        if self.user.height > self.attraction.min_height && self.user.tickets > self.attraction.tickets
            self.user.tickets -= self.attraction.tickets
            self.user.happiness += self.attraction.happiness_rating
            self.user.nausea += self.attraction.nausea_rating
            self.user.save
            return "Thanks for riding the #{self.attraction.name}!!"
        end
        msg.join(' ')
    end

end
