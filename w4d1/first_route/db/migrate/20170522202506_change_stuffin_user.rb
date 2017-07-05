class ChangeStuffinUser < ActiveRecord::Migration
  def change
    remove_column :users, :admin
    add_column :users, :username, :string
  end
end
