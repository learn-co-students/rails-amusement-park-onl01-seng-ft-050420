class RidesController < ApplicationController

    def create
        # byebug
        ride = Ride.new(user_id: current_user.id, attraction_id: params[:format])
        msg = ride.take_ride
        redirect_to user_path(current_user), alert: msg
    end


end
