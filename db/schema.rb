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

ActiveRecord::Schema.define(version: 2019_03_09_221513) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "class_rooms", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_class_rooms_on_user_id"
  end

  create_table "class_rooms_users", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "class_room_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["class_room_id"], name: "index_class_rooms_users_on_class_room_id"
    t.index ["user_id"], name: "index_class_rooms_users_on_user_id"
  end

  create_table "groups", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.bigint "user_id"
    t.bigint "study_case_id"
    t.bigint "class_room_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["class_room_id"], name: "index_groups_on_class_room_id"
    t.index ["study_case_id"], name: "index_groups_on_study_case_id"
    t.index ["user_id"], name: "index_groups_on_user_id"
  end

  create_table "groups_users", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "group_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["group_id"], name: "index_groups_users_on_group_id"
    t.index ["user_id"], name: "index_groups_users_on_user_id"
  end

  create_table "images", force: :cascade do |t|
    t.string "path"
    t.bigint "study_case_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["study_case_id"], name: "index_images_on_study_case_id"
  end

  create_table "study_cases", force: :cascade do |t|
    t.string "title"
    t.text "description"
    t.bigint "class_room_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["class_room_id"], name: "index_study_cases_on_class_room_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "name"
    t.integer "role", default: 0
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "videos", force: :cascade do |t|
    t.string "path"
    t.bigint "study_case_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["study_case_id"], name: "index_videos_on_study_case_id"
  end

  create_table "words", force: :cascade do |t|
    t.string "name"
    t.integer "kind", default: 0
    t.bigint "study_case_id"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["study_case_id"], name: "index_words_on_study_case_id"
    t.index ["user_id"], name: "index_words_on_user_id"
  end

  add_foreign_key "class_rooms", "users"
  add_foreign_key "class_rooms_users", "class_rooms"
  add_foreign_key "class_rooms_users", "users"
  add_foreign_key "groups", "class_rooms"
  add_foreign_key "groups", "study_cases"
  add_foreign_key "groups", "users"
  add_foreign_key "groups_users", "groups"
  add_foreign_key "groups_users", "users"
  add_foreign_key "images", "study_cases"
  add_foreign_key "study_cases", "class_rooms"
  add_foreign_key "videos", "study_cases"
  add_foreign_key "words", "study_cases"
  add_foreign_key "words", "users"
end
