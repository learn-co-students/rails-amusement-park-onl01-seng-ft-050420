class UsersController < ApplicationController
    before_action :set_user, only: [:create]

    def index
        @users =
         User.all
    end

    def new
        @user = User.new
    end

    def create
        if @user.save
            session[:user_id] = @user.id
            redirect_to user_path(@user)
        else
            render :new, alert: "Invalid credentials"
        end
    end

    def show
        if logged_in?
            @user = current_user
        else
            redirect_to '/'
        end
    end


    private

        

        def set_user
            @user = User.new(user_params)
        end

        def user_params
            params.require(:user).permit(:name, :password, :happiness, :nausea, :height, :tickets, :admin)
        end
end
