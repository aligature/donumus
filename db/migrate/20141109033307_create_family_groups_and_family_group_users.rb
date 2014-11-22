class CreateFamilyGroupsAndFamilyGroupUsers < ActiveRecord::Migration
  def change
    create_table :family_groups do |t|
      t.string :name

      t.timestamps
    end

    create_table :family_group_users do |t|
      t.integer :family_group_id
      t.integer :user_id

      t.timestamps
    end
  end
end
