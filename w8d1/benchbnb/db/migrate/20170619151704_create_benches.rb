class CreateBenches < ActiveRecord::Migration[5.0]
  def change
    create_table :benches do |t|
      t.string :description, null: false
      t.float :lat
      t.float :long
      t.timestamps
    end
  end
end
