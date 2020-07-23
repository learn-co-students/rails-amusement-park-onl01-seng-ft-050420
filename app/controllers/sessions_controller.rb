class SessionsController < ApplicationController
  def new
    @user = User.new
  end

  def create
    set_user
    if @current_user && @current_user.authenticate(params[:user][:password])
      session[:user_id] = @current_user.id
      redirect_to user_path(@current_user)
    else
      redirect_to signin_path
    end
  end

  def destroy
    session.delete :user_id
    redirect_to root_path
  end
end