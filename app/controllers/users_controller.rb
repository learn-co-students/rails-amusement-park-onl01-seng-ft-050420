class UsersController < ApplicationController
    before_action :require_login
    skip_before_action :require_login, only: [:new, :create]

    def new
        @user = User.new
    end

    def create
        @user = User.create(user_params)

        session[:user_id] = @user.id
        redirect_to user_path(@user)
    end

    def show
        @user = User.find_by(id: params[:id])
    end

    private

    def user_params
        params.require(:user).permit(:name, :height, :nausea, :tickets, :admin, :password, :happiness)
    end

    def require_login
        redirect_to root_url unless session.include? :user_id
    end
end
  