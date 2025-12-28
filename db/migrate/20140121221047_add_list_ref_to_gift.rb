class AddListRefToGift < ActiveRecord::Migration[4.2]
  def change
    add_reference :gifts, :list, index: true
  end
end
