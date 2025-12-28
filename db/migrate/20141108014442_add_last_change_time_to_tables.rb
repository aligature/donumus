class AddLastChangeTimeToTables < ActiveRecord::Migration[4.2]
  def change
     add_column :gifts, :last_change_time, :datetime
     add_column :lists, :last_change_time, :datetime
     add_column :users, :last_change_time, :datetime
     add_column :families, :last_change_time, :datetime
  end
end
