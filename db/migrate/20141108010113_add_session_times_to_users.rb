class AddSessionTimesToUsers < ActiveRecord::Migration
  def change
     add_column :users, :last_session_time, :datetime
     add_column :users, :current_session_time, :datetime
  end
end
