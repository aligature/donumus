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

ActiveRecord::Schema.define(version: 20161207031824) do

  create_table "addresses", force: :cascade do |t|
    t.string   "address",    limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
    t.string   "label",      limit: 255
  end

  create_table "emails", force: :cascade do |t|
    t.string   "email",      limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
    t.string   "label",      limit: 255
  end

  create_table "families", force: :cascade do |t|
    t.string   "name",             limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
    t.datetime "last_change_time"
  end

  create_table "family_users", force: :cascade do |t|
    t.integer  "family_id"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "family_users", ["family_id", "user_id"], name: "index_family_users_on_family_id_and_user_id", unique: true

  create_table "gifts", force: :cascade do |t|
    t.string   "description",      limit: 255
    t.string   "link",             limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "list_id"
    t.integer  "added_by_user_id"
    t.boolean  "starred"
    t.boolean  "hidden"
    t.datetime "last_change_time"
  end

  add_index "gifts", ["list_id"], name: "index_gifts_on_list_id"

  create_table "list_users", force: :cascade do |t|
    t.integer  "list_id"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "list_users", ["list_id", "user_id"], name: "index_list_users_on_list_id_and_user_id", unique: true

  create_table "lists", force: :cascade do |t|
    t.string   "name",             limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "personal"
    t.datetime "last_change_time"
  end

  add_index "lists", ["name"], name: "index_lists_on_name", unique: true

  create_table "phone_numbers", force: :cascade do |t|
    t.integer  "phone_number"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
    t.string   "label",        limit: 255
  end

  create_table "pollyannas", force: :cascade do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "giver_id"
    t.integer  "receiver_id"
    t.string   "name"
  end

  create_table "statuses", force: :cascade do |t|
    t.integer  "gift_id"
    t.integer  "added_by_user_id"
    t.integer  "status"
    t.string   "note",             limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "user_notes", force: :cascade do |t|
    t.string  "notes",   limit: 255
    t.integer "user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string   "username",             limit: 255
    t.string   "name",                 limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "sign_in_count",                    default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip",   limit: 255
    t.string   "last_sign_in_ip",      limit: 255
    t.boolean  "administrator"
    t.date     "birthday"
    t.datetime "last_session_time"
    t.datetime "current_session_time"
    t.datetime "last_change_time"
    t.datetime "remember_created_at"
    t.string   "remember_token"
  end

  add_index "users", ["username"], name: "index_users_on_username", unique: true

end
