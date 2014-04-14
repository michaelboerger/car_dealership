class AddMakeToCar < ActiveRecord::Migration
  def change
    add_column :cars, :make_id, :integer
    add_index :cars, :make_id
  end
end
