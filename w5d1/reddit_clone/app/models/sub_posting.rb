# == Schema Information
#
# Table name: sub_postings
#
#  id         :integer          not null, primary key
#  post_id    :integer          not null
#  sub_id     :integer          not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class SubPosting < ActiveRecord::Base
  validates :post, :sub, presence: true
  validates :post, uniqueness: { scope: :sub }

  belongs_to :sub
  belongs_to :post
end
