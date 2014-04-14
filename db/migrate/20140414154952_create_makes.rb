class CreateMakes < ActiveRecord::Migration
  def change
    create_table :makes do |t|
      t.text :name, null: false
      t.text :country, null: false

      t.timestamps
    end
  end
end
