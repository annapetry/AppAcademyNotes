class CatsController < ApplicationController
  before_action :editor_owns_cat, only: [:update]
  
  def index
    @cats = Cat.all
    
    render :index
  end
  
  def show
    @cat = Cat.find(params[:id])
    @rentals = @cat.rental_requests
                   .order("start_date")
    
    render :show
  end
  
  def new
    @cat = Cat.new
    
    render :new
  end
  
  def edit
    @cat = Cat.find(params[:id])
    render :edit
  end
  
  def update  
    @cat = Cat.find_by(user_id: current_user.id)
    
    if @cat.update_attributes(cat_purrrams)
      redirect_to cat_url(@cat)
    else
      render :edit
    end
  end
  
  def create
    @cat = current_user.cats.new(cat_purrrams)

    if @cat.save
      redirect_to cat_url(@cat)
    else
      render :new
    end
  end
  
  private
  
  def editor_owns_cat
    current_cat = Cat.find(params[:id])
    
    redirect_to(cats_url) unless current_cat.user_id == current_user.id
  end
  
  def cat_purrrams
    params.require(:cat).permit(:age, :birth_date, :color, :name, :sex, :description)
  end
end
