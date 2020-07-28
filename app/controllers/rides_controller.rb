class RidesController < ApplicationController
def create
    ride = Ride.new(ride_params)
    message = ride.take_ride
    redirect_to user_path(ride.user), flash: {message: message}
end
def ride_params
    params.require(:ride).permit(:attraction_id, :user_id)
end
end