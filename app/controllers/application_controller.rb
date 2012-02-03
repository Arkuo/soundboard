class ApplicationController < ActionController::Base
  protect_from_forgery

  helper_method :current_user, :logged_in?
  
  
  def current_user=(user)
    return if user.nil?
    @current_user = user
    session[:current_user_id] = user.id
  end
  
  def current_user
    @current_user || User.find_by_id(session[:current_user_id])
  end
  
  def logged_in?
    !!current_user
  end

end
