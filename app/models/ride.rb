class Ride < ActiveRecord::Base
    belongs_to :user
    belongs_to :attraction

    def take_ride 
        if tall? && tickets? 
            update_params
        elsif !tall? && tickets? 
            "Sorry. You are not tall enough to ride the #{attraction.name}."
        elsif !tickets? && tall?
            "Sorry. You do not have enough tickets to ride the #{attraction.name}."
        else 
            "Sorry. You do not have enough tickets to ride the #{attraction.name}. You are not tall enough to ride the #{attraction.name}."
        end
    end

    def tall?
        user.height > attraction.min_height ? true : false 
    end

    def tickets?
        user.tickets >= attraction.tickets ? true : false 
    end

    def update_params
        user.nausea = user.nausea + attraction.nausea_rating
        user.happiness = user.happiness + attraction.happiness_rating
        user.tickets = user.tickets - attraction.tickets
        user.save
        "Thanks for riding the #{attraction.name}!"
    end
end
