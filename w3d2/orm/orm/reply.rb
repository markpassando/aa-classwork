require_relative 'model_base'

class Reply < ModelBase

  def self.find_by_user_id(user_id)
    reply = QuestionsDataBase.execute(<<-SQL, user_id)
      SELECT
        *
      FROM
        replies
      WHERE
        user_id = ?
    SQL

    reply.map { |r| Reply.new(r) }
  end

  def self.find_by_question_id(question_id)
    reply = QuestionsDataBase.execute(<<-SQL, question_id)
      SELECT
        *
      FROM
        replies
      WHERE
        question_id = ?
    SQL

    reply.map { |r| Reply.new(r) }
  end



  attr_accessor :id, :question_id, :user_id, :body, :parent_id

  def initialize(options)
    @id = options['id']
    @question_id = options['question_id']
    @user_id = options['user_id']
    @body = options['body']
    @parent_id = options['parent_id']
  end

  def author
    User.find_by_id(self.user_id)
  end

  def question
    Question.find_by_id(self.question_id)
  end

  def parent_reply
    raise "no parent" unless @parent_id
    Reply.find_by_id(self.parent_id)
  end

  def child_replies
    children = QuestionsDataBase.execute(<<-SQL, @id)
      SELECT
        *
      FROM
        replies
      WHERE
        parent_id = ?
    SQL

    children.map { |r| Reply.new(r) }
  end

end
