class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  helper_method :current_user
  helper_method :auth_token

  def auth_token
    html = "<input type='hidden' name='authenticity_token' value="
    html += form_authenticity_token
    html += ">"
    html.html_safe
  end

  def current_user
    User.find_by(session_token: session[:session_token])
  end

  def login!(user)
    user.reset_session_token!
    session[:session_token] = user.session_token
  end

  def logged_in?
    return true if current_user
    false
  end

  private
  def user_params
    params.require(:user).permit(:username, :password)
  end


  def redirect_logged_in_user
    redirect_to users_url if current_user
  end

  def redirect_not_logged_in_user
    redirect_to new_session_url unless current_user
  end

end
