# == Schema Information
#
# Table name: users
#
#  id         :integer          not null, primary key
#  name       :string           not null
#  email      :string           not null
#  created_at :datetime
#  updated_at :datetime
#  username   :string
#

class User < ActiveRecord::Base
  validates :email, :username, presence: true, uniqueness: true
  validates :name, presence: true

  has_many :artworks,
    class_name: 'Artwork',
    foreign_key: :artist_id

  has_many :artwork_shared, #this diplays artwork that you made that has been shared
    class_name: 'ArtworkShare',
    foreign_key: :viewer_id

  has_many :shared_artworks,
    through: :artwork_shared,
    source: :artwork
end
