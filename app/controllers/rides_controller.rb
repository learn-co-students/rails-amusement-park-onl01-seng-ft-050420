class RidesController < ApplicationController
  def index 

  end 

  def new
  end

  def create
    ride = Ride.create(ride_params)
    alert = ride.take_ride
    redirect_to user_path(ride.user_id), flash: {message: alert }
  end

  def show
  end

  def edit
  end

  def update
  end

  def delete
  end

  private 

  def ride_params 
    params.require(:ride).permit(:user_id, :attraction_id)
  end 
end
