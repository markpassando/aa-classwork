# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


ActiveRecord::Base.transaction do

  User.destroy_all
  user1 = User.create(:name => "Yusaku")
  user2 = User.create(:name => "Mark")
  user3 = User.create(:name => "Bernie")
  user4 = User.create(:name => "Donald")
  user5 = User.create(:name => "Hillary")

  Poll.destroy_all
  poll1 = Poll.create(title: "Political Affliatiion", user_id: user1.id)
  poll2 = Poll.create(title: "Favorite Foods", user_id: user2.id)


  Question.destroy_all
  question1 = Question.create(question: "What's your leaning?", poll_id: poll1.id)
  question2 = Question.create(question: "What's your favorite icecream?", poll_id: poll2.id)

  AnswerChoice.destroy_all
  a1 = AnswerChoice.create(answer_choice: "Right", question_id: question1.id)
  a2 = AnswerChoice.create(answer_choice: "Left", question_id: question1.id)
  a3 = AnswerChoice.create(answer_choice: "Far-Left", question_id: question1.id)
  a4 = AnswerChoice.create(answer_choice: "Tea Party", question_id: question1.id)

  a5 = AnswerChoice.create(answer_choice: "Chocolate", question_id: question2.id)
  a6 = AnswerChoice.create(answer_choice: "Vanilla", question_id: question2.id)
  a7 = AnswerChoice.create(answer_choice: "Strawberry", question_id: question2.id)
  a8 = AnswerChoice.create(answer_choice: "Bernie", question_id: question2.id)


  Response.destroy_all
  Response.create(:user_id => user5.id, :answer_choice_id => a2.id)
  Response.create(:user_id => user4.id, :answer_choice_id => a1.id)
  Response.create(:user_id => user3.id, :answer_choice_id => a3.id)
  Response.create(:user_id => user2.id, :answer_choice_id => a3.id)
  Response.create(:user_id => user1.id, :answer_choice_id => a3.id)

  Response.create(:user_id => user5.id, :answer_choice_id => a8.id)
  Response.create(:user_id => user4.id, :answer_choice_id => a6.id)
  Response.create(:user_id => user3.id, :answer_choice_id => a6.id)
  Response.create(:user_id => user2.id, :answer_choice_id => a6.id)
  Response.create(:user_id => user1.id, :answer_choice_id => a6.id)

end
