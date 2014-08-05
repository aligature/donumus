class RemovePasswordFromUsers < ActiveRecord::Migration
  def change
     remove_column :users, :email, :encrypted_password
     remove_column :users, :email, :reset_password_token
     remove_column :users, :email, :reset_password_sent_at
     remove_column :users, :email, :remember_created_at
  end
end
