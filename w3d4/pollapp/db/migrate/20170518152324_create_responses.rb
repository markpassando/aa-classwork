class CreateResponses < ActiveRecord::Migration
  def change
    create_table :responses do |t|
      t.timestamps
      t.integer :user_id, null: false
      t.integer :answer_choice_id, null: false
    end
  end
end
