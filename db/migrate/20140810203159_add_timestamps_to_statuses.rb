class AddTimestampsToStatuses < ActiveRecord::Migration[4.2]
  def change
     add_column(:statuses, :created_at, :datetime)
     add_column(:statuses, :updated_at, :datetime)
  end
end
