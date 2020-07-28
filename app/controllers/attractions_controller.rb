class AttractionsController < ApplicationController
    def index
        @attractions = Attraction.all
        @user = current_user
    end
    def new
        @attraction = Attraction.new
    end
    def create
        if attraction = Attraction.create(attraction_params)
           # binding.pry
        redirect_to attraction_path(attraction)
        else
        redirect_to attractions
        end
    end
    def show
        @attraction = Attraction.find_by(id: params[:id])
        @user = current_user
        @ride = @attraction.rides.build(user_id: @user.id)
    end

    
    def edit 
        #@attraction = Attraction.find(params[:id])
        @attraction = Attraction.find(current_user[:id])
    end

    def update
        #@attraction = Attraction.find(params[:id])
        @attraction = Attraction.find(current_user[:id])
        if @attraction.update(attraction_params)
          redirect_to attraction_path(@attraction), :alert => "You Just Updated The Attraction"
        else
          render 'edit', :alert => "Please Fill In All Forms"
        end
      end
      
private


def attraction_params
    params.require(:attraction).permit(:name, :min_height, :nausea_rating, :happiness_rating, :tickets)
  end
end