class AddStarredToGifts < ActiveRecord::Migration[4.2]
  def change
     add_column :gifts, :starred, :boolean
  end
end
