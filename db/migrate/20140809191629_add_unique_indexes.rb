class AddUniqueIndexes < ActiveRecord::Migration[4.2]
  def change
     add_index :users, [:username], :unique => true
     add_index :lists, [:name], :unique => true
     add_index :list_users, [:list_id, :user_id], :unique => true
     add_index :family_users, [:family_id, :user_id], :unique => true
  end
end
