class AddHiddenToFamilyUsers < ActiveRecord::Migration
  def change
     add_column :family_users, :hidden, :boolean
  end
end
