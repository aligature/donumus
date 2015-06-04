# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20141126045507) do

  create_table "addresses", force: true do |t|
    t.string   "address"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
    t.string   "label"
  end

  create_table "emails", force: true do |t|
    t.string   "email"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
    t.string   "label"
  end

  create_table "families", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.datetime "last_change_time"
  end

  create_table "family_family_groups", force: true do |t|
    t.integer  "family_group_id"
    t.integer  "family_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "family_group_users", force: true do |t|
    t.integer  "family_group_id"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "family_groups", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "family_users", force: true do |t|
    t.integer  "family_id"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "hidden"
  end

  add_index "family_users", ["family_id", "user_id"], name: "index_family_users_on_family_id_and_user_id", unique: true

  create_table "gifts", force: true do |t|
    t.string   "description"
    t.string   "link"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "list_id"
    t.integer  "added_by_user_id"
    t.boolean  "starred"
    t.boolean  "hidden"
    t.datetime "last_change_time"
  end

  add_index "gifts", ["list_id"], name: "index_gifts_on_list_id"

  create_table "list_users", force: true do |t|
    t.integer  "list_id"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "list_users", ["list_id", "user_id"], name: "index_list_users_on_list_id_and_user_id", unique: true

  create_table "lists", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "personal"
    t.datetime "last_change_time"
  end

  add_index "lists", ["name"], name: "index_lists_on_name", unique: true

  create_table "phone_numbers", force: true do |t|
    t.integer  "phone_number"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
    t.string   "label"
  end

  create_table "statuses", force: true do |t|
    t.integer  "gift_id"
    t.integer  "added_by_user_id"
    t.integer  "status"
    t.string   "note"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "user_notes", force: true do |t|
    t.string  "notes"
    t.integer "user_id"
  end

  create_table "users", force: true do |t|
    t.string   "username"
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "sign_in_count",        default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.boolean  "administrator"
    t.date     "birthday"
    t.datetime "last_session_time"
    t.datetime "current_session_time"
    t.datetime "last_change_time"
  end

  add_index "users", ["username"], name: "index_users_on_username", unique: true

end
