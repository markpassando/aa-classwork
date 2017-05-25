class TracksController < ApplicationController

  before_action :require_user!

  def index
    @tracks = Track.all
    render :index
  end

  def new
    @albums = Album.all
    @album_id = params[:album_id]
    render :new
  end

  def show
    @track = Track.find(params[:id])

    if @track
      render :show
    else
      render :new
    end
  end

  def create
    @track = Track.new(track_params)
    #debugger
    if @track.save
      redirect_to track_url(@track.id)
    else
      flash.now[:errors] = ["Invalid Field Name"]
      @albums = Album.all
      render :new
    end
  end

  def destroy
    band = Track.find(params[:id])
    if band
      band.destroy
      redirect_to bands_url
    end

  end

  def track_params
    params.require(:track).permit(:album_id, :song, :bonus)
  end
end
