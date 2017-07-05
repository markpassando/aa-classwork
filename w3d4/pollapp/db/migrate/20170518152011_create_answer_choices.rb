class CreateAnswerChoices < ActiveRecord::Migration
  def change
    create_table :answer_choices do |t|
      t.timestamps
      t.integer :question_id, null: false
      t.string :answer_choice, null: false
    end
  end
end
