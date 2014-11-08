class AddPersonalToLists < ActiveRecord::Migration
  def change
     add_column :lists, :personal, :boolean
  end
end
