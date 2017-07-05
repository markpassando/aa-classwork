require_relative 'model_base'

class QuestionLike < ModelBase

  def self.likers_for_question_id(question_id)
    likers = QuestionsDataBase.execute(<<-SQL, question_id)
      SELECT
        users.*
      FROM
        users
      JOIN
        question_likes ON users.id = question_likes.user_id
      WHERE
        question_likes.question_id = ?
    SQL

    likers.map { |u| User.new(u) }
  end

  def self.num_likes_for_question_id(question_id)
    num_likes = QuestionsDataBase.execute(<<-SQL, question_id)
      SELECT
        COUNT(question_likes.user_id) AS likes
      FROM
        question_likes
      JOIN
        questions ON questions.id = question_likes.question_id
      WHERE
        questions.id = ?
    SQL

    num_likes.first['likes']
  end

  def self.liked_questions_for_user_id(user_id)
    questions = QuestionsDataBase.execute(<<-SQL, user_id)
      SELECT
        questions.*
      FROM
        questions
      JOIN
        question_likes ON questions.id = question_likes.question_id
      WHERE
        question_likes.user_id = ?
    SQL

    questions.map { |q| Question.new(q) }
  end

  def self.most_liked_questions(n)
    questions = QuestionsDataBase.execute(<<-SQL, n)
      SELECT
        questions.*
      FROM
        questions
      LEFT OUTER JOIN
        question_likes ON questions.id = question_likes.question_id
      GROUP BY
        questions.id
      ORDER BY
        COUNT(question_likes.id) DESC
      LIMIT ?
    SQL

    questions.map { |q| Question.new(q) }
  end

  attr_accessor :id, :question_id, :user_id

  def initialize(options)
    @id = options['id']
    @question_id = options['question_id']
    @user_id = options['user_id']
  end
end
