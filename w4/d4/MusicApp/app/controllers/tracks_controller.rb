class TracksController < ApplicationController

  before_action :redirect_not_logged_in_user

  def create
    @album = Album.find(params[:album_id])
    @track = @album.tracks.new(track_params)

    if @track.save
      redirect_to album_url(@album)
    else
      render :new
    end
  end

  def new
    @album = Album.find(params[:album_id])
    @track = Track.new
    render :new
  end

  def update
    @track = Track.find(params[:id])
    if @track.update_attributes(track_params)
      redirect_to track_url(@track)
    else
      render :edit
    end
  end

  def edit
    @track = Track.find(params[:id])
    render :edit
  end

  def show
    @track = Track.find(params[:id])
    render :show
  end

  def destroy
    @track = Track.find(params[:id])
    @track.delete
    flash[:notice] = "You've deleted #{@track.name}! jerk."
    redirect_to album_url(@track.album)
  end

  private
  def track_params
    params
      .require(:track)
      .permit(:album_id, :name, :track_type, :lyrics)
  end
end
