class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :logged_in?, :current_user, :redirect_if_not_logged_in

  def logged_in?
    !!session[:user_id]
  end

  def current_user
    @current_user ||= User.find_by_id(session[:user_id])
  end

  def redirect_if_not_logged_in
    if !logged_in?
      redirect_to '/'
    end
  end
end
