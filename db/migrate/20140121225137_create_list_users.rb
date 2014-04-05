class CreateListUsers < ActiveRecord::Migration
  def change
    create_table :list_users do |t|
      t.string :name
      t.integer :list_id
      t.integer :user_id

      t.timestamps
    end
  end
end
