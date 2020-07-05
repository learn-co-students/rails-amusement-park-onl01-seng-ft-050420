class AttractionsController < ApplicationController
    def index
        @attractions = Attraction.all
        @user = User.find_by(id: session[:user_id])
    end

    def show
        @user = User.find_by(id: session[:user_id])
        @attraction = Attraction.find_by(id: params[:id])
    end

    def edit
        @attraction = Attraction.find_by(id: params[:id])
    end

    def update
        @user = User.find_by(id: session[:user_id])
        @attraction = Attraction.find_by(id: params[:id])

        if !@user.admin

            if @user.tickets >= @attraction.tickets && @user.height >= @attraction.min_height
                @user.tickets -= @attraction.tickets
                @user.happiness = @attraction.happiness_rating
                @user.save
                message = "Thanks for riding the #{@attraction.name}!"
            else
                message = ""
            end

            if @user.height <= @attraction.min_height
                message << "You are not tall enough to ride the #{@attraction.name}"
            end

            if @user.tickets <= @attraction.tickets
                message << "You do not have enough tickets to ride the #{@attraction.name}"
            end

            redirect_to user_path(@user), flash: { message: message }
            
        else

            attraction = Attraction.find_by(id: params[:id])
            attraction.update(attraction_params)
            redirect_to attraction_path(attraction)

        end
    
    end

    def new
        @user = User.find_by(id: session[:user_id])
        redirect_to root_url if !@user.admin

        @attraction = Attraction.new
    end

    def create
        attraction = Attraction.create(attraction_params)
        redirect_to attraction_path(attraction)
    end
    
    private

    def attraction_params
        params.require(:attraction).permit(:name, :min_height, :tickets, :happiness_rating, :nausea_rating)
    end
end