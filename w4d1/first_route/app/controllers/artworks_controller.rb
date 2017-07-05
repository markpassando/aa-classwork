class ArtworksController < ApplicationController

  def index
    artworks = Artwork.where
    render json: artworks
  end

  def show
    begin
      artwork = Artwork.find(params[:id])
      render json: artwork
    rescue
      render text: "artwork not found"
    end
  end

  def create
    new_artwork = Artwork.new(artwork_params)

    if new_artwork.save
      render json: new_artwork
    else
      render(
      json: new_artwork.errors.full_messages, status: :unprocessable_entity
    )
    end
  end


  def update
      updated_artwork = Artwork.find(params[:id]).update(artwork_params)
      render json: updated_artwork
  end

  def destroy
      begin
        found_artwork = find_artwork
        found_artwork.destroy
        render json: found_artwork
      rescue
        render text: "artwork not found"
      end
  end

  private
  def artwork_params
    params.require(:artwork).permit(:artist_id, :title, :image_url)
  end

  def find_artwork
    Artwork.find(params[:id])
  end

end
