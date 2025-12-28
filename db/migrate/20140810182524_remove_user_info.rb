class RemoveUserInfo < ActiveRecord::Migration[4.2]
  def change
     drop_table :user_infos
     remove_column :user_notes, :user_info_id, :integer
     add_column :user_notes, :user_id, :integer
     remove_column :addresses, :user_info_id, :integer
     add_column :addresses, :user_id, :integer
     remove_column :emails, :user_info_id, :integer
     add_column :emails, :user_id, :integer
     remove_column :phone_numbers, :user_info_id, :integer
     add_column :phone_numbers, :user_id, :integer
  end
end
