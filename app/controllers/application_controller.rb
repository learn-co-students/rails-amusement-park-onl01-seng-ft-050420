class ApplicationController < ActionController::Base
  include ApplicationHelper
  protect_from_forgery with: :exception
  before_action :current_user
  helper_method :logged_in?
  helper_method :current_user

  
  def current_user 
    @current_user ||= User.find_by(id: session[:user_id]) if session[:user_id]
  end

  def logged_in?
    redirect_to root_path unless session[:user_id]
  end

end
