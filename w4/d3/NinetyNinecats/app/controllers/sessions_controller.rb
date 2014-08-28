class SessionsController < ApplicationController
  before_action :redirect_logged_in_user, only: [:new]
  
  def new
    @session_user = User.new

    render :new 
  end
  
  def create
    @session_user = User.find_by_credentials(
      params[:user][:user_name],
      params[:user][:password]
    )
                  
    if @session_user.id
      login_user!(@session_user)

      redirect_to cats_url
    else
      render :new
    end
  end
  
  def destroy
    current_user.reset_session_token!
    session[:session_token] = nil
    
    redirect_to cats_url
  end
 
end
