class UsersController < ApplicationController
  
  def new
    @user = User.new
  end
  
  def create
    @user = User.new(user_params)
    
    if @user.save
      login!(@user)
      redirect root_url
    else
      flash[:notice] = @user.errors.full_messages
      render :new
    end
  end
  
  def show
  end
  
  def user_params
    params.require(:user).permit(:username, :password)
  end
end
