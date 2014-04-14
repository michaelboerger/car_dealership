class OhMyGodIAmSoDumb < ActiveRecord::Migration
  # Seriously? Seriously.
  # I really did this twice by mistake.
  def up
   change_column :makes, :name, :string
   change_column :makes, :country, :string
  end

  def down
   change_column :makes, :name, :text
   change_column :makes, :country, :text
  end
end
