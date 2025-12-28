class RemoveHiddenNoteFromGifts < ActiveRecord::Migration[4.2]
  def change
     remove_column :gifts, :hidden_note, :string
  end
end
