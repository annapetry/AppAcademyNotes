class AlbumsController < ApplicationController

  before_action :redirect_not_logged_in_user

  def create
    @band = Band.find(params[:band_id])
    @album = @band.albums.new(album_params)

    if @album.save
      redirect_to band_url(@band)
    else
      render :new
    end
  end

  def new
    @album = Album.new
    @band = Band.find(params[:band_id])
    render :new
  end

  def show
    @album = Album.find(params[:id])
    render :show
  end

  def update
    @album = Album.find(params[:id])
    if @album.update_attributes(album_params)
      redirect_to album_url(@album)
    else
      render :edit
    end
  end

  def edit
    @album = Album.find(params[:id])
    render :edit
  end

  def destroy
    @album = Album.find(params[:id])
    @album.delete
    flash[:notice] = "You've deleted #{@album.name}! jerk."
    redirect_to bands_url(@album.band)
  end

  private
  def album_params
    params.require(:album).permit(:name, :version, :band_id)
  end
end
