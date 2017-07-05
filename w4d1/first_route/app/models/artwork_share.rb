# == Schema Information
#
# Table name: artwork_shares
#
#  id         :integer          not null, primary key
#  artwork_id :integer          not null
#  viewer_id  :integer          not null
#  created_at :datetime
#  updated_at :datetime
#

class ArtworkShare < ActiveRecord::Base
  belongs_to :artwork,
    class_name: 'Artwork'

  belongs_to :viewer,
    class_name: 'User',
    foreign_key: :viewer_id
end
