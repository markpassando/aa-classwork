class CreatePolls < ActiveRecord::Migration
  def change
    create_table :polls do |t|
      t.timestamps
      t.integer :user_id, null: false
      t.string :title, null: false
    end
  end
end
