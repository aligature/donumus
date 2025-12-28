class AddHiddenToGifts < ActiveRecord::Migration[4.2]
  def change
     add_column :gifts, :hidden, :boolean
     add_column :gifts, :hidden_note, :string
  end
end
