class CatRentalRequestsController < ApplicationController
  def new
    @rental_request = CatRentalRequest.new
    
    render :new
  end
  
  def create
    @rental_request = current_user.rental_requests.new(cat_rental_request_purrrams)
    
    if @rental_request.save
      redirect_to cat_url(@rental_request.cat)
    else
      render :new
    end
  end
  
  def approve_request
    cat_request = CatRentalRequest.find(params[:cat_rental_request_id])
    cat_request.approve!
    
    
    redirect_to cat_url(cat_request.cat)
  end
  
  def deny_request
    cat_request = CatRentalRequest.find(params[:cat_rental_request_id])
    cat_request.deny!
    
    redirect_to cat_url(cat_request.cat)
  end
  
  private
  
  def cat_rental_request_purrrams
    params.require(:cat_rental_request).permit(:start_date, :end_date, :cat_id)
  end
end
