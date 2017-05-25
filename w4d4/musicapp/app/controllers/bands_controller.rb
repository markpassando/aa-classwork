class BandsController < ApplicationController

  before_action :require_user!

  def index
    @bands = Band.all
    render :index
  end

  def new
    render :new
  end

  def show
    @band = Band.find(params[:id])

    if @band
      render :show
    else
      render :new
    end
  end

  def create
    @band = Band.new(band_params)

    if @band.save
      redirect_to band_url(@band.id)
    else
      flash.now[:errors] = ["Invalid Band Name"]
      render :new
    end
  end

  def destroy
    band = Band.find(params[:id])
    if band
      band.destroy
      redirect_to bands_url
    end

  end

  def band_params
    params.require(:band).permit(:name)
  end
end
