class RidesController < ApplicationController
  def create
    @ride = Ride.new(ride_params)
    if @ride.take_ride
      @ride.save
      redirect_to user_path(current_user), alert: "Thanks for riding the #{@ride.attraction.name}!"
    else
      @user = current_user
      render 'users/show'
    end
  end
  private
  def ride_params
    params.require(:ride).permit(:user_id, :attraction_id)

  end
end
