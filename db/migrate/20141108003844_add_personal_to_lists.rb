class AddPersonalToLists < ActiveRecord::Migration[4.2]
  def change
     add_column :lists, :personal, :boolean
  end
end
