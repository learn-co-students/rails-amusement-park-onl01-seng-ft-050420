class AttractionsController < ApplicationController
  def index
    if logged_in?
      @attractions = Attraction.all 
    else 
      redirect_to root_path 
    end  
  end

  def create 

  end 

  def show 
    if logged_in?
      find_attraction
      @ride = @attraction.rides.build(user_id: current_user.id )
    else 
      redirect_to root_path
    end 
  end 

  def new 
  
    if logged_in? && is_admin?
      @attraction = Attraction.new 
    else 
      redirect_to attractions_path 
    end 
  end 

  def create 
    @attraction = Attraction.create(attraction_params)
    redirect_to attraction_path(@attraction)
  end 

  def edit 
    if logged_in? 
      find_attraction 
    else 
      redirect_to root_path 
    end 
  end 

  def update 
    attraction = find_attraction
    attraction.update(attraction_params)
    redirect_to attraction_path(attraction)
  end 

  private 

  def find_attraction
    @attraction = Attraction.find(params[:id])
  end 

  def attraction_params 
    params.require(:attraction).permit(:name, :happiness_rating, :nausea_rating, :tickets, :min_height)
  end 
end
