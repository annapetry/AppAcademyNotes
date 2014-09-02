class GoalsController < ApplicationController
  before_action :require_user
  def index
    @goals = Goal.all
    render :index
  end

  def show
    
  end

  def new
    @goal = Goal.new
  end

  def create
     @goal = current_user.goals.new(goal_params)
 
      if @goal.save
       redirect_to goals_url
     else
       flash.now[:errors] = @goal.errors.full_messages
       render :new
     end
  end

  def edit
    @goal = Goal.find(params[:id])
  end

  def update
    @goal = Goal.find_by(params[:id])
    
    if @goal.update_attributes(goal_params)
      redirect_to goals_url
    else
      flash.now[:errors] = @goal.errors.full_messages
      render :edit
    end
  end

  def destroy
  end
  
  private
  def goal_params
    params.require(:goal).permit(:body, :complete, :secret)
  end
end
