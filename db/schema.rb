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

ActiveRecord::Schema.define(version: 20160607180351) do

  create_table "actors", force: :cascade do |t|
    t.string   "name"
    t.string   "cover"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "actors_videos", id: false, force: :cascade do |t|
    t.integer "video_id", null: false
    t.integer "actor_id", null: false
  end

  create_table "episodes", force: :cascade do |t|
    t.integer  "episodeNumber"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  create_table "genres", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "genres_videos", id: false, force: :cascade do |t|
    t.integer "genre_id", null: false
    t.integer "video_id", null: false
  end

  create_table "locations", force: :cascade do |t|
    t.text     "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.integer  "video_id"
  end

  add_index "locations", ["video_id"], name: "index_locations_on_video_id"

  create_table "platforms", force: :cascade do |t|
    t.string   "name"
    t.boolean  "borrowed"
    t.datetime "borrowedDate"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.integer  "location_id"
  end

  add_index "platforms", ["location_id"], name: "index_platforms_on_location_id"

  create_table "regisseurs", force: :cascade do |t|
    t.string   "name"
    t.string   "cover"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "seasons", force: :cascade do |t|
    t.integer  "number"
    t.string   "cover"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "series", force: :cascade do |t|
    t.string   "name"
    t.string   "cover"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

  create_table "videos", force: :cascade do |t|
    t.string   "videoType"
    t.string   "name"
    t.boolean  "seen"
    t.integer  "length"
    t.string   "cover"
    t.date     "release"
    t.integer  "raiting"
    t.text     "summary"
    t.integer  "ageRating"
    t.text     "note"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.integer  "location_id"
  end

  add_index "videos", ["location_id"], name: "index_videos_on_location_id"

end
