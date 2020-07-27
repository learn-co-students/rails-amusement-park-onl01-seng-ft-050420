class SessionsController < ApplicationController

    def new
    end

    def create
        # byebug
        if @user = User.find_by_id(params[:user_name])
            session[:user_id] = @user.id
            redirect_to user_path(@user)
        else
            render :new, alert: "Invalid password."
        end
    end

    def destroy
        session.clear
        redirect_to '/'
    end

end