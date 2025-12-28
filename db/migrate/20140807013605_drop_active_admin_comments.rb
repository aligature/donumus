class DropActiveAdminComments < ActiveRecord::Migration[4.2]
  def change
     remove_index :active_admin_comments, [:namespace]
     remove_index :active_admin_comments, [:author_type, :author_id]
     remove_index :active_admin_comments, [:resource_type, :resource_id]
     drop_table :active_admin_comments
  end
end
