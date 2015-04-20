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

ActiveRecord::Schema.define(version: 20150420143523) do

  create_table "categories", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "category_of_todos", force: :cascade do |t|
    t.integer  "todo_id"
    t.integer  "category_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "comments", force: :cascade do |t|
    t.text     "content"
    t.integer  "todo_id"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "comments", ["todo_id"], name: "index_comments_on_todo_id"
  add_index "comments", ["user_id"], name: "index_comments_on_user_id"

  create_table "event_users", force: :cascade do |t|
    t.integer  "event_id"
    t.integer  "user_id"
    t.integer  "todo_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "events", force: :cascade do |t|
    t.string   "name"
    t.string   "location"
    t.date     "date"
    t.time     "time"
    t.text     "notes"
    t.integer  "user_id"
    t.integer  "todo_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "search_suggestions", force: :cascade do |t|
    t.string   "term"
    t.integer  "popularity"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "todos", force: :cascade do |t|
    t.string   "name"
    t.text     "description"
    t.string   "link"
    t.string   "image"
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
    t.string   "new_image_file_name"
    t.string   "new_image_content_type"
    t.integer  "new_image_file_size"
    t.datetime "new_image_updated_at"
  end

  create_table "travel_deals", force: :cascade do |t|
    t.string  "url"
    t.integer "deal_id"
    t.string  "title"
    t.string  "img"
    t.float   "price"
    t.date    "exp_date"
  end

  create_table "user_todos", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "todo_id"
    t.boolean  "finished",   default: false
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.text   "bio"
    t.string "user_img_url"
    t.string "uid"
    t.string "email"
    t.string "provider"
    t.string "first_name"
  end

end
