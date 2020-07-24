class AttractionsController < ApplicationController
    before_action :logged_in?
    def index 
        @attractions = Attraction.all 
    end

    def new 
        @attraction = Attraction.new
    end

    def create 
        @attraction = Attraction.new (attraction_params)
        if @attraction.save
            redirect_to attraction_path(@attraction)
        else 
            redirect_to attractions_path
        end
    end

    def show 
        @attraction = Attraction.find_by(id: params[:id])
        @ride = @attraction.rides.build(user_id: current_user.id)
    end

    def edit 
        @attraction = Attraction.find_by(id: params[:id])
    end

    def update 
        @attraction = Attraction.find_by(id: params[:id])
        if @attraction.update(attraction_params)
            redirect_to attraction_path(@attraction)
        else 
            render :edit
        end
    end

    private 
    def attraction_params
        params.require(:attraction).permit(:name, :tickets, :min_height, :nausea_rating, :happiness_rating)
    end
end
