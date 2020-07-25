class Ride < ActiveRecord::Base
    belongs_to :attraction 
    belongs_to :user

    # #build_association is for a belongs_to
    # ride.build_attraction(attributes)

    # #association.build is for a has_many 
    # attraction.ride.build(foriegn_key: attribute)

    def take_ride
        if enough_tickets? && tall_enough? 
            self.user.update(update_after_ride_attribuites)
            "Thanks for riding the #{attraction.name}!"
        elsif !enough_tickets? && !tall_enough?
            "Sorry. You do not have enough tickets to ride the #{attraction.name}. You are not tall enough to ride the #{attraction.name}."
        elsif !enough_tickets? 
            "Sorry. You do not have enough tickets to ride the #{attraction.name}."
        elsif !tall_enough? 
            "Sorry. You are not tall enough to ride the #{attraction.name}." 
        end
    end

    def enough_tickets? 
        self.user.tickets > self.attraction.tickets 
    end 

    def tall_enough? 
        self.user.height > self.attraction.min_height 
    end 

    def update_after_ride_attribuites
        new_tickets = self.user.tickets - self.attraction.tickets
        new_happiness = self.user.happiness + self.attraction.happiness_rating
        new_nausea = self.user.nausea + self.attraction.nausea_rating
        new = {tickets: new_tickets, happiness: new_happiness, nausea: new_nausea}
    end 
end
