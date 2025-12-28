class RemoveNameFromListUsers < ActiveRecord::Migration[4.2]
  def change
     remove_column :list_users, :name
  end
end
