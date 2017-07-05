class CreateUserTable < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.timestamps
      t.string :name, null: false
    end
  end
end
