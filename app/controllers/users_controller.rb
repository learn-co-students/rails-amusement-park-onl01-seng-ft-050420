class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    user = User.new(user_params)
    if user.valid?
      user.save
      login user
      redirect_to user_path user
    else
      render :new
    end
  end

  def show
    logged_in? ? (@user = User.find_by_id(params[:id])) : (redirect_to '/')
  end

  private

  def user_params
    params.require(:user).permit(:name, :height, :happiness, :nausea, :tickets, :admin, :password)
  end
end
