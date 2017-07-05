class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.timestamps
      t.integer :poll_id, null: false
      t.string :question, null: false
    end
  end
end
