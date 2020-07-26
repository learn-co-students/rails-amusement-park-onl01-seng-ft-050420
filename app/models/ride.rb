class Ride < ActiveRecord::Base
    belongs_to :attraction
    belongs_to :user

    def take_ride
        if user.tickets < attraction.tickets
            render :user/show
        else
            redirect to '/attractions/show'
        end
        if user.height < attraction.min_height
            render :user/show
        else
            redirect to '/attractions/show'
        end
        if user.height < attraction.min_height && user.tickets < attraction.tickets
            render :user/show
        else
            redirect to '/attractions/show'
        end

    end
end
