class FixPollyannasType < ActiveRecord::Migration
  def change
     remove_column :pollyannas, :type
     add_column :pollyannas, :name, :string
  end
end
