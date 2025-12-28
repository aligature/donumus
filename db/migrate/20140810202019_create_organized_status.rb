class CreateOrganizedStatus < ActiveRecord::Migration[4.2]
  def change
    create_table :statuses do |t|
       t.integer :gift_id
       t.integer :added_by_user_id
       t.integer :status
       t.string :note
    end

    remove_column :gifts, :status, :string

    add_column :gifts, :added_by_user_id, :integer
  end
end
