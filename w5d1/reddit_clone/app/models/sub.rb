# == Schema Information
#
# Table name: subs
#
#  id          :integer          not null, primary key
#  title       :string           not null
#  description :string           not null
#  user_id     :integer          not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Sub < ActiveRecord::Base
  validates :title, :description, :moderator, presence: true
  validates :title, uniqueness: true

  has_many :sub_postings, dependent: :destroy, inverse_of: :sub

  has_many :posts,
    through: :sub_postings,
    source: :post

  belongs_to :moderator,
    class_name: :User,
    foreign_key: :user_id
end
