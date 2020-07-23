module ApplicationHelper
  def set_user
    @current_user ||= User.find_by_name(params[:user][:name])
  end

  def logged_in?
    !!session[:user_id]
  end
end
