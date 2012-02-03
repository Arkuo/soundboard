class SessionsController < ApplicationController
  def create
    self.current_user = User.find_or_create_from_auth_hash(auth_hash)
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
