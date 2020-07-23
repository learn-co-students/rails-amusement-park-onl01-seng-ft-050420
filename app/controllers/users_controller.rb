class UsersController < ApplicationController
    before_action :set_user, only: [:show]
    before_action :logged_in?, only: [:show]
    def new
        @user = User.new
    end

    def create
        @user = User.new(user_params)
        if @user.valid?
            @user.save
            session[:user_id] = @user.id
            redirect_to user_path(@user.id)
        else
            redirect_to root_path
        end
    end
    
    def show
        login_required
    end

    private
    def user_params
        params.require(:user).permit(:name, :password, :height, :tickets, :nausea, :happiness, :admin)
    end

    def set_user
        @user = User.find_by_id(params[:id])
    end

    def login_required
        if !logged_in?
            redirect_to root_path
        end
    end
end
