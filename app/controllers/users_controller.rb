class UsersController < ApplicationController
    def index
        @users = User.All
    end
    
    def new
        @user = User.new
    end

    def create
        if user = User.create(user_params)
            session[:user_id] = user.id
            redirect_to user_path(user)
        else
            redirect_to new_user_path
        end
    end

    def show
        redirect_if_not_logged_in
    end

private
    def user_params
        params.require(:user).permit(:name, :password, :password_confirmation, :nausea, :happiness, :height, :tickets, :admin)
    end
end