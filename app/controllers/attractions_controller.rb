class AttractionsController < ApplicationController
    before_action :set_attraction, only: [:show, :edit, :update]

    def index
        @attractions = Attraction.all
    end

    def show

    end

    def ride
        attraction = Attraction.find_by_id(params[:id])
        flash[:message] = Ride.create(user: current_user, attraction: attraction).take_ride
        redirect_to user_path(current_user)
    end

    def new
        @attraction = Attraction.new
    end

    def create
        @attraction = Attraction.new(attraction_params)
        if @attraction.save
            redirect_to attraction_path(@attraction)
        else
            render 'new'
        end
    end

    def edit

    end

    def update
        if @attraction.update(attraction_params)
            redirect_to attraction_path(@attraction)
        else
            render 'edit'
        end
    end

    private
    def attraction_params
        params.require(:attraction).permit(:name, :happiness_rating, :nausea_rating, :min_height, :tickets)
    end

    def set_attraction
        @attraction = Attraction.find_by_id(params[:id])
    end
end
