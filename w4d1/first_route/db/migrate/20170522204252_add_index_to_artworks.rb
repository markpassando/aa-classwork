class AddIndexToArtworks < ActiveRecord::Migration
  def change
    add_index(:artworks, :artist_id)
  end
end
