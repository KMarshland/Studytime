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

ActiveRecord::Schema.define(version: 20140521200257) do

  create_table "addresses", force: true do |t|
    t.string   "line1"
    t.string   "line2"
    t.string   "city"
    t.string   "state"
    t.string   "zip"
    t.integer  "addressable_id"
    t.string   "addressable_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "rims", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "studygroups", force: true do |t|
    t.time     "when"
    t.string   "where"
    t.string   "websiteLink"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "daysFromNow"
    t.integer  "host_id"
    t.date     "todaysDate"
    t.float    "duration"
  end

  add_index "studygroups", ["host_id"], name: "index_studygroups_on_host_id"

  create_table "studygroups_users", force: true do |t|
    t.integer "studygroup_id"
    t.integer "user_id"
  end

  create_table "test_stuffs", force: true do |t|
    t.float    "duration"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.string   "provider"
    t.string   "uid"
    t.string   "name"
    t.string   "oauth_token"
    t.datetime "oauth_expires_at"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "email"
    t.boolean  "is_admin"
  end

  create_table "users_studygroups", id: false, force: true do |t|
    t.integer "users_id"
    t.integer "studygroups_id"
  end

end
