class Ride < ActiveRecord::Base
    belongs_to :attraction
    belongs_to :user

    def take_ride
        #accounts for user not being tall enough 
        #accounts for user not having enough tickets
        #updates the ticket number, by subtracting from user.tickets
        
        if self.user.height < self.attraction.min_height && self.user.tickets < self.attraction.tickets
            "Sorry. You do not have enough tickets to ride the #{self.attraction.name}. You are not tall enough to ride the #{self.attraction.name}."
        elsif self.user.tickets < self.attraction.tickets
            "Sorry. You do not have enough tickets to ride the #{self.attraction.name}."
        elsif self.user.height < self.attraction.min_height
            "Sorry. You are not tall enough to ride the #{self.attraction.name}."
        else
            self.user.update(tickets: self.user.tickets - self.attraction.tickets, nausea: self.attraction.nausea_rating + self.user.nausea, happiness: self.user.happiness + self.attraction.happiness_rating)
            "Thanks for riding the #{self.attraction.name}!"
        end
    end
end
