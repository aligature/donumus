class AddLabelToInfo < ActiveRecord::Migration[4.2]
  def change
     add_column :addresses, :label, :string
     add_column :emails, :label, :string
     add_column :phone_numbers, :label, :string
  end
end
