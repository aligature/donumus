class AddListRefToGift < ActiveRecord::Migration
  def change
    add_reference :gifts, :list, index: true
  end
end
