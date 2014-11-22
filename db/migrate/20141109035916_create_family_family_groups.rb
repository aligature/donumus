class CreateFamilyFamilyGroups < ActiveRecord::Migration
  def change
    create_table :family_family_groups do |t|
      t.integer :family_group_id
      t.integer :family_id

      t.timestamps
    end
  end
end
