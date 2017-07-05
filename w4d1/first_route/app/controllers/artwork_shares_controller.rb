class ArtworkSharesController < ApplicationController
  #
  def index
    artworks = ArtworkShare.all
    render json: artworks
  end
  
  # def show
  #   begin
  #     artwork = Artwork.find(params[:id])
  #     render json: artwork
  #   rescue
  #     render text: "artwork not found"
  #   end
  # end

  def create
    new_artwork_share = ArtworkShare.new(artwork_share_params)

    if new_artwork_share.save
      render json: new_artwork_share
    else
      render(
      json: new_artwork_share.errors.full_messages, status: :unprocessable_entity
    )
    end
  end
  #
  #
  # def update
  #     updated_artwork = ArtworkShare.find(params[:id]).update(artwork_params)
  #     render json: updated_artwork
  # end

  def destroy
      begin
        found_artwork_share = find_artwork_shares
        found_artwork_share.destroy
        render json: found_artwork_share
      rescue
        render text: "Sharing not found"
      end
  end

  private
  def artwork_share_params
    params.require(:artwork_share).permit(:artwork_id, :viewer_id)
  end

  def find_artwork_shares
    ArtworkShare.find(params[:id])
  end

end
