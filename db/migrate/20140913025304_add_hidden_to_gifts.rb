class AddHiddenToGifts < ActiveRecord::Migration
  def change
     add_column :gifts, :hidden, :boolean
     add_column :gifts, :hidden_note, :string
  end
end
