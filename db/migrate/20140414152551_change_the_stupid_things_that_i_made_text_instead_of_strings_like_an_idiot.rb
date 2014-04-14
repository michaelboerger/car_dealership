class ChangeTheStupidThingsThatIMadeTextInsteadOfStringsLikeAnIdiot < ActiveRecord::Migration
# EXCITING BONUS MIGRATION ACTION!!!
  def up
   change_column :cars, :color, :string
   change_column :cars, :mileage, :string
  end

  def down
   change_column :cars, :color, :text
   change_column :cars, :mileage, :text
  end
end
