# == Schema Information
#
# Table name: artworks
#
#  id         :integer          not null, primary key
#  title      :string           not null
#  image_url  :string           not null
#  artist_id  :integer          not null
#  created_at :datetime
#  updated_at :datetime
#

class Artwork < ActiveRecord::Base
  validates :title, uniqueness: { scope: :artist_id,
    message: "can not create the same image twice"
  }

  belongs_to :artist,
    class_name: 'User'

  has_many :shared_viewers,
    class_name: 'ArtworkShare',
    foreign_key: :artwork_id

end
