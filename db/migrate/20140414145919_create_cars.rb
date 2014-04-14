class CreateCars < ActiveRecord::Migration
  def change
    create_table :cars do |t|
      t.text :color, null: false
      t.text :year, null: false
      t.text :mileage, null: false
      t.text :description

      t.timestamps
    end
  end
end
