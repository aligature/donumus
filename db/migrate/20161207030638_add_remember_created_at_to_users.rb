class AddRememberCreatedAtToUsers < ActiveRecord::Migration[4.2]
  def self.up
     add_column :users, :remember_created_at, :datetime
  end

  def self.down
     remove_column :users, :remember_created_at
  end
end
