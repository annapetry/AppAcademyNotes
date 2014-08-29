class SessionsController < ApplicationController

  before_action :redirect_logged_in_user, only: [:new]

  def create
    @user = User.find_by_credentials(
        params[:user][:username],
        params[:user][:password]
    )

    if @user
      login!(@user)
      redirect_to bands_url
    else
      @user = User.new(user_params)
      render :new
    end

  end

  def new
    @user = User.new

    render :new
  end

  def destroy
    current_user.reset_session_token!
    session[:session_token] = nil

    redirect_to  new_session_url
  end

end
