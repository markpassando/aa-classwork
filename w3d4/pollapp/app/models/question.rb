# == Schema Information
#
# Table name: questions
#
#  id         :integer          not null, primary key
#  created_at :datetime
#  updated_at :datetime
#  poll_id    :integer          not null
#  question   :string           not null
#

class Question < ActiveRecord::Base
  validates :question, presence: true

  belongs_to :poll,
    class_name: 'Poll',
    primary_key: :id,
    foreign_key: :poll_id

  has_many :answer_choices,
    class_name: 'AnswerChoice',
    primary_key: :id,
    foreign_key: :question_id

  has_many :responses,
    through: :answer_choices,
    source: :responses

  # def results
  #     answer_choices = self.answer_choices.includes(:responses)
  #     responses = {}
  #
  #     answer_choices.each do |answer_choice|
  #       responses[answer_choice[:answer_choice]] = answer_choice.responses.count
  #     end
  #
  #     responses
  # end

  def results
      answer_choices = self.answer_choices.includes(:responses)
      responses = {}

      answer_choices.each do |answer_choice|
        responses[answer_choice[:answer_choice]] = answer_choice.responses.count
      end

      responses
  end

  <<-SQL
  SELECT
    answer_choices.*, COUNT(answer_choices.id) AS total_responses
  FROM
    questions
  JOIN
    answer_choices ON questions.id = answer_choices.question_id
  JOIN
    responses ON answer_choices.id = responses.answer_choice_id
  WHERE
    questions.id = 2
  GROUP BY
    answer_choices.id

  SQL
end



SELECT column-names
  FROM answer_choices LEFT JOIN table-name2
    ON column-name1 = column-name2
 WHERE condition
