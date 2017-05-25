class AlbumsController < ApplicationController

  before_action :require_user!

  def index
    @albums = Album.all
    render :index
  end

  def new
    @bands = Band.all
    @artist_id = params[:band_id]
    #debugger
    render :new
  end

  def show
    @album = Album.find(params[:id])

    if @album
      render :show
    else
      render :new
    end
  end

  def create
    @album = Album.new(album_params)

    if @album.save
      redirect_to album_url(@album.id)
    else
      flash.now[:errors] = ["Invalid Field Name"]
      @bands = Band.all
      render :new
    end
  end

  def destroy
    band = Album.find(params[:id])
    if band
      band.destroy
      redirect_to bands_url
    end

  end

  def album_params
    params.require(:album).permit(:band_id, :title, :studio)
  end
end
