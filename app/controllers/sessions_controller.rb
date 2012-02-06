class SessionsController < ApplicationController
  def create
    self.current_user = User.find_or_create_from_auth_hash(auth_hash)
    if logged_in?
      flash[:notice] = "You're logged in"
    else
      flash[:notice] = "You're not allowed here"
    end
    redirect_to root_path
  end
  
  def failure
    logger.debug request.env['omniauth.error']
    render text: '#FAIL'
  end
  
protected

def auth_hash
  logger.debug request.env['omniauth.auth'].inspect
  request.env['omniauth.auth']
end
    
  
end
