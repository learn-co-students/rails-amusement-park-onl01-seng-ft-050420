class AttractionsController < ApplicationController
    before_action :set_attraction, only: [:show, :edit, :update]
    def index
        @attractions = Attraction.all
    end

    def new
        @attraction = Attraction.new
    end

    def create
        @attraction = Attraction.new(attraction_params)
        if @attraction.save
            redirect_to attraction_path(@attraction)
        else
            render :new, alert: "Invalid information."
        end
    end

    def show
    end

    def edit
        if current_user.admin == false
            redirect_to attractions_path
        end
    end

    def update
        if @attraction.update(attraction_params)
            redirect_to attraction_path(@attraction)
        else
            render :edit, alert: "Invalid information."
        end
    end

    private
        def set_attraction
            @attraction = Attraction.find_by_id(params[:id])
        end

        def attraction_params
            params.require(:attraction).permit(:name, :tickets, :min_height, :happiness_rating, :nausea_rating)
        end

end
