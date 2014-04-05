class RemoveNameFromListUsers < ActiveRecord::Migration
  def change
     remove_column :list_users, :name
  end
end
