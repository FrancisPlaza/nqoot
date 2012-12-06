class ApplicationController < ActionController::Base
  protect_from_forgery
  
private
  
  # Helper method to get the current_user, a current
  # logged in user in the session.
  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end
  helper_method :current_user
end
