class CreatePollyannas < ActiveRecord::Migration[4.2]
  def change
    create_table :pollyannas do |t|
      t.timestamps
      t.integer :giver_id
      t.integer :receiver_id
      t.string :type
    end
  end
end
