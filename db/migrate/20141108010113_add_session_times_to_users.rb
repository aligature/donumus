class AddSessionTimesToUsers < ActiveRecord::Migration[4.2]
  def change
     add_column :users, :last_session_time, :datetime
     add_column :users, :current_session_time, :datetime
  end
end
