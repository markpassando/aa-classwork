class CreatePostSubs < ActiveRecord::Migration
  def change
    create_table :sub_postings do |t|
      t.integer :post_id, null: false
      t.integer :sub_id, null: false
      t.timestamps null: false
    end
  end
end
