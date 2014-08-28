class UsersController < ApplicationController
  before_action :redirect_logged_in_user, only: [:new]
  
  def new
    @user = User.new
    
    render :new
  end
  
  def create
    @user = User.new(user_params)
    
    if @user.save
      login_user!(@user)
      redirect_to cats_url
    else
      render :new
    end
  end
  
  def show
    @user = User.find(params[:id])
    
    render :show
  end

end
