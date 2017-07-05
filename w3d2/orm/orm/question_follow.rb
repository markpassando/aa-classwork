require_relative 'model_base'

class QuestionFollow < ModelBase

  def self.followers_for_question_id(question_id)
    users = QuestionsDataBase.execute(<<-SQL, question_id)
      SELECT
        users.*
      FROM
        users
      JOIN
        question_follows ON question_follows.user_id = users.id
      WHERE
        question_id = ?
    SQL

    users.map { |u| User.new(u) }
  end

  def self.followed_questions_for_user_id(user_id)
    questions = QuestionsDataBase.execute(<<-SQL, user_id)
      SELECT
        questions.*
      FROM
        questions
      JOIN
        question_follows ON question_follows.question_id = questions.id
      WHERE
        user_id = ?
    SQL

    questions.map { |q| Question.new(q) }
  end

  def self.most_followed_questions(n)
    questions = QuestionsDataBase.execute(<<-SQL, n)
      SELECT
        questions.*
      FROM
        questions
      LEFT OUTER JOIN
        question_follows ON questions.id = question_follows.question_id
      GROUP BY
        questions.id
      ORDER BY
        COUNT(question_follows.id) DESC
      LIMIT ?
    SQL

    questions.map { |q| Question.new(q) }
  end

  attr_accessor :id, :question_id, :user_id

  def intialize(options)
    @id = options['id']
    @question_id = options['question_id']
    @user_id = options['user_id']
  end

end
