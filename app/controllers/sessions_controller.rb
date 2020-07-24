class SessionsController < ApplicationController
  def new
    @users = User.all
  end

  def create
    user = User.find_by_id(params[:user_name])
    if user.try(:authenticate, params[:password])
      login user
      redirect_to user_path user
    else
      render :new
    end
  end

  def destroy
    session.delete :user_id if logged_in?
    redirect_to '/'
  end
end
