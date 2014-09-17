class ApplicationController < ActionController::Base
  # protect_from_forgery 
  
  helper_method :current_user
  
  def login!(user)
    @current_user = user
    session[:session_token] = @current_user.reset_session_token!
  end
  
  def logout!(user)
    user.reset_session_token!
    session[:session_token] = nil
  end
  
  def current_user
  @current_user ||= User.find_by_session_token(session[:session_token])
  end
  
end
