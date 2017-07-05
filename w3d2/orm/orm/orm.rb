require 'sqlite3'
require 'singleton'

require_relative 'user.rb'
require_relative 'question.rb'
require_relative 'reply.rb'
require_relative 'question_follow.rb'
require_relative 'question_like.rb'

class QuestionsDataBase < SQLite3::Database
  include Singleton

  def self.execute(*args)
    self.instance.execute(*args)
  end

  def initialize
    super('../questions.db')
    self.type_translation = true
    self.results_as_hash = true
  end

end
