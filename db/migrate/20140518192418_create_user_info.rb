class CreateUserInfo < ActiveRecord::Migration[4.2]

   def change

      create_table :user_infos do |t|
         t.belongs_to :user
         t.timestamps
      end

      create_table :user_notes do |t|
         t.belongs_to :user_info
         t.string :notes
      end

      create_table :addresses do |t|
         t.belongs_to :user_info
         t.string :address
         t.timestamps
      end

      create_table :emails do |t|
         t.belongs_to :user_info
         t.string :email
         t.timestamps
      end

      create_table :phone_numbers do |t|
         t.belongs_to :user_info
         t.integer :phone_number
         t.timestamps
      end

   end

end
