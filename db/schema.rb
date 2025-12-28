# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.1].define(version: 2016_12_07_031824) do
  create_table "addresses", force: :cascade do |t|
    t.string "address"
    t.datetime "created_at", precision: nil
    t.datetime "updated_at", precision: nil
    t.integer "user_id"
    t.string "label"
  end

  create_table "emails", force: :cascade do |t|
    t.string "email"
    t.datetime "created_at", precision: nil
    t.datetime "updated_at", precision: nil
    t.integer "user_id"
    t.string "label"
  end

  create_table "families", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: nil
    t.datetime "updated_at", precision: nil
    t.datetime "last_change_time", precision: nil
  end

  create_table "family_users", force: :cascade do |t|
    t.integer "family_id"
    t.integer "user_id"
    t.datetime "created_at", precision: nil
    t.datetime "updated_at", precision: nil
    t.index ["family_id", "user_id"], name: "index_family_users_on_family_id_and_user_id", unique: true
  end

  create_table "gifts", force: :cascade do |t|
    t.string "description"
    t.string "link"
    t.datetime "created_at", precision: nil
    t.datetime "updated_at", precision: nil
    t.integer "list_id"
    t.integer "added_by_user_id"
    t.boolean "starred"
    t.boolean "hidden"
    t.datetime "last_change_time", precision: nil
    t.index ["list_id"], name: "index_gifts_on_list_id"
  end

  create_table "list_users", force: :cascade do |t|
    t.integer "list_id"
    t.integer "user_id"
    t.datetime "created_at", precision: nil
    t.datetime "updated_at", precision: nil
    t.index ["list_id", "user_id"], name: "index_list_users_on_list_id_and_user_id", unique: true
  end

  create_table "lists", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: nil
    t.datetime "updated_at", precision: nil
    t.boolean "personal"
    t.datetime "last_change_time", precision: nil
    t.index ["name"], name: "index_lists_on_name", unique: true
  end

  create_table "phone_numbers", force: :cascade do |t|
    t.integer "phone_number"
    t.datetime "created_at", precision: nil
    t.datetime "updated_at", precision: nil
    t.integer "user_id"
    t.string "label"
  end

  create_table "pollyannas", force: :cascade do |t|
    t.datetime "created_at", precision: nil
    t.datetime "updated_at", precision: nil
    t.integer "giver_id"
    t.integer "receiver_id"
    t.string "name"
  end

  create_table "statuses", force: :cascade do |t|
    t.integer "gift_id"
    t.integer "added_by_user_id"
    t.integer "status"
    t.string "note"
    t.datetime "created_at", precision: nil
    t.datetime "updated_at", precision: nil
  end

  create_table "user_notes", force: :cascade do |t|
    t.string "notes"
    t.integer "user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "username"
    t.string "name"
    t.datetime "created_at", precision: nil
    t.datetime "updated_at", precision: nil
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at", precision: nil
    t.datetime "last_sign_in_at", precision: nil
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.boolean "administrator"
    t.date "birthday"
    t.datetime "last_session_time", precision: nil
    t.datetime "current_session_time", precision: nil
    t.datetime "last_change_time", precision: nil
    t.datetime "remember_created_at", precision: nil
    t.string "remember_token"
    t.index ["username"], name: "index_users_on_username", unique: true
  end

end
