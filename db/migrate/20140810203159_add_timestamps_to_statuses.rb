class AddTimestampsToStatuses < ActiveRecord::Migration
  def change
     add_column(:statuses, :created_at, :datetime)
     add_column(:statuses, :updated_at, :datetime)
  end
end
