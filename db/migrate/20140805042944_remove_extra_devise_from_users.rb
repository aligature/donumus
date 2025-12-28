class RemoveExtraDeviseFromUsers < ActiveRecord::Migration[4.2]
  def change
     remove_index :users, [:email]
     remove_index :users, [:reset_password_token]
     remove_column :users, :email
     remove_column :users, :encrypted_password
     remove_column :users, :reset_password_token
     remove_column :users, :reset_password_sent_at
     remove_column :users, :remember_created_at
  end
end
