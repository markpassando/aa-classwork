# == Schema Information
#
# Table name: polls
#
#  id         :integer          not null, primary key
#  created_at :datetime
#  updated_at :datetime
#  user_id    :integer          not null
#  title      :string           not null
#

class Poll < ActiveRecord::Base
  validates :title, presence: true

  belongs_to :author,
    class_name: "User",
    primary_key: :id,
    foreign_key: :user_id

  has_many :questions,
    class_name: "Question",
    primary_key: :id,
    foreign_key: :question_id

end
