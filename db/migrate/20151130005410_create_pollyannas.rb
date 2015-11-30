class CreatePollyannas < ActiveRecord::Migration
  def change
    create_table :pollyannas do |t|
      t.timestamps
      t.integer :giver_id
      t.integer :receiver_id
      t.string :type
    end
  end
end
