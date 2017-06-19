class AddBenchCols < ActiveRecord::Migration[5.0]
  def change
    add_column :benches, :description, :string, nil: false
    add_column :benches, :lat, :float
    add_column :benches, :long, :float
  end
end
