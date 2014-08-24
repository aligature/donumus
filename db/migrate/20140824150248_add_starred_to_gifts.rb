class AddStarredToGifts < ActiveRecord::Migration
  def change
     add_column :gifts, :starred, :boolean
  end
end
