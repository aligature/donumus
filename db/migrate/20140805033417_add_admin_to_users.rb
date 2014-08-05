class AddAdminToUsers < ActiveRecord::Migration
  def change
     change_table :users do |t|
        t.boolean :administrator
     end
  end
end
