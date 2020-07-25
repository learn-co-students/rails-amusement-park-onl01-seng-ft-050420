class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :current_user, :is_admin? 



  def logged_in? 
    !!session[:user_id]
  end 

  def current_user 
    user ||= User.find(session[:user_id])
  end 

  def is_admin? 
    current_user.admin
  end 
end
