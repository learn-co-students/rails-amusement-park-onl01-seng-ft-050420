module SessionsHelper
  def login(user)
    session[:user_id] = user.id if user
  end
  def logged_in?
    !!session[:user_id]
  end
  def current_user
    User.find_by_id(session[:user_id])
  end
end
