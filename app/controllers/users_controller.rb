class UsersController < ApplicationController
    def new
        @user = User.new
    end
    def create
        @user = User.new(user_params)
    end
    def show
    end

    def home
        render 'users/homepage'
    end 
    private

    def user_params
        params.require(:user).permit(:name, :height, :nausea, :happiness, :tickets, :password, :admin)
    end

    
end
