class FixPollyannasType < ActiveRecord::Migration[4.2]
  def change
     remove_column :pollyannas, :type
     add_column :pollyannas, :name, :string
  end
end
