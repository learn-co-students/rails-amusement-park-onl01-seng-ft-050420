class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :current_user
 # before_action :verified_user
  private

  def current_user
    #User.find(session[:user_id])
    return unless session[:user_id]
    @current_user ||= User.find(session[:user_id])
  end
  
def verified_user
  if !current_user
    redirect_to '/'
  end
end

  #def admin
  #  if @user.admin == true 
  #  end
  #end

end
