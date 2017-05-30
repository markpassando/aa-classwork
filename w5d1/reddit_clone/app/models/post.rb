# == Schema Information
#
# Table name: posts
#
#  id         :integer          not null, primary key
#  title      :string           not null
#  url        :string
#  content    :string
#  user_id    :integer          not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Post < ActiveRecord::Base
  validates :title, :subs, :author, presence: true

  has_many :sub_postings, dependent: :destroy, inverse_of: :post

  has_many :subs,
  through: :sub_postings,
  source: :sub

  belongs_to :author,
    class_name: :User,
    foreign_key: :user_id

  has_many :comments
end
