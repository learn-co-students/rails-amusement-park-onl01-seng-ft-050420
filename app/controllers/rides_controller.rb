class RidesController < ApplicationController 

    def create 
        ride = Ride.create(ride_params)
        error = ride.take_ride
        redirect_to user_path(ride.user), flash: {message: error }
    end

    private 

    def ride_params 
        params.require(:ride).permit(:user_id, :attraction_id)
    end
end