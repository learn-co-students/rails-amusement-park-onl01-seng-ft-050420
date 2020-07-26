class AttractionsController < ApplicationController
    def new
        @attraction = Attraction.new
    end
    def create
        @attraction = Attraction.new(attraction_params)
    end
    def show
    end


private


def attraction_params
    params.require(:attraction).permit(:name, :min_height, :nausea_rating, :happiness_rating, :tickets)
  end
end