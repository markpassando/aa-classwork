# == Schema Information
#
# Table name: responses
#
#  id               :integer          not null, primary key
#  created_at       :datetime
#  updated_at       :datetime
#  user_id          :integer          not null
#  answer_choice_id :integer          not null
#

class Response < ActiveRecord::Base

  belongs_to :answer_choice,
    class_name: 'AnswerChoice',
    primary_key: :id,
    foreign_key: :answer_choice_id

  belongs_to :respondent,
    class_name: 'User',
    primary_key: :id,
    foreign_key: :user_id

  # has_many :answer_choices,
  #   class_name: 'AnswerChoice',
  #   primary_key: :id,
  #   foreign_key: :answer_choice_id

  has_one :question,
    through: :answer_choice,
    source: :question

  def sibling_responses
    self.question.responses.where.not(id: self.id)
    #self.question.responses.where('id != ?', :id)
  end

  def respondent_already_answered?
    sibling_responses.exists?(self.user_id)
  end

  def not_duplicate_response
    if respondent_already_answered?
      errors[:response] << "Respondent has already responded!"
    end
  end

  def not_author_of_question
    if self.question.poll.user_id == self.user_id
      errors[:response] << "Author can not respond to their own poll!"
    end
  end

end
