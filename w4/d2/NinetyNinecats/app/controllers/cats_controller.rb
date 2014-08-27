class CatsController < ApplicationController
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
  
  def create
    @cat = Cat.new(cat_purrrams)
    
    if @cat.save
      redirect_to cat_url(@cat)
    else
      render :new
    end
  end
  
  private
  
  def cat_purrrams
    params.require(:cat).permit(:age, :birth_date, :color, :name, :sex, :description)
  end
end
