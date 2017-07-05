# == Schema Information
#
# Table name: users
#
#  id         :integer          not null, primary key
#  created_at :datetime
#  updated_at :datetime
#  name       :string           not null
#

class User < ActiveRecord::Base
  validates :name, uniqueness: false, presence: true

  has_many :authored_polls,
    class_name: "Poll",
    primary_key: :id,
    foreign_key: :user_id

  has_many :responses,
    class_name: "Response",
    primary_key: :id,
    foreign_key: :user_id


end
