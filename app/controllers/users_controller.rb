class UsersController < ApplicationController
    before_action :require_login, only: [:show]

    def new
        @user = User.new
    end


    def create
        @user = User.new(user_params)
        if @user.save && @user.authenticate(params[:user][:password])
          session[:user_id] = @user.id 
          redirect_to user_path(@user)
        else
            redirect_to root_path
        end
    end

    def show
        @user = User.find(params[:id])
    end

    def home

    end

    def take_ride
      @attraction = Attraction.find_by_id(params[:attraction][:id])
      flash[:message] = Ride.create(user: current_user, attraction: @attraction).take_ride
      redirect_to user_path(current_user)
    end

    private

    def user_params
        params.require(:user).permit(:name, :password, :height, :tickets, :nausea, :happiness, :admin)
    end

    def require_login
        unless session[:user_id]
          flash[:error] = "You must be logged in to access this section"
          redirect_to root_url
        end
    end
end
