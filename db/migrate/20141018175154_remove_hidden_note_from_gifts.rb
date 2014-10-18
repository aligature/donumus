class RemoveHiddenNoteFromGifts < ActiveRecord::Migration
  def change
     remove_column :gifts, :hidden_note, :string
  end
end
