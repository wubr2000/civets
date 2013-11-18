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

ActiveRecord::Schema.define(version: 20131115133347) do

  create_table "jobs", force: true do |t|
    t.string   "company"
    t.string   "location"
    t.string   "title"
    t.date     "hired_on"
    t.date     "left_on"
    t.text     "responsibilities"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "jobs", ["user_id"], name: "index_jobs_on_user_id"

  create_table "jobs_vitaes", id: false, force: true do |t|
    t.integer "job_id"
    t.integer "vitae_id"
  end

  create_table "refs", force: true do |t|
    t.string   "name"
    t.string   "title"
    t.string   "email"
    t.string   "phone"
    t.string   "relationship"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "refs", ["user_id"], name: "index_refs_on_user_id"

  create_table "refs_vitaes", id: false, force: true do |t|
    t.integer "ref_id"
    t.integer "vitae_id"
  end

  create_table "registrants", force: true do |t|
    t.string   "email"
    t.string   "code"
    t.datetime "expires_at"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "schools", force: true do |t|
    t.string   "name"
    t.string   "location"
    t.string   "major"
    t.date     "enrolled_on"
    t.date     "left_on"
    t.boolean  "did_graduate"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "schools", ["user_id"], name: "index_schools_on_user_id"

  create_table "schools_vitaes", id: false, force: true do |t|
    t.integer "school_id"
    t.integer "vitae_id"
  end

  create_table "users", force: true do |t|
    t.string   "name"
    t.string   "email"
    t.string   "salt"
    t.string   "fish"
    t.string   "code"
    t.datetime "expires_at"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "vitaes", force: true do |t|
    t.string   "name"
    t.string   "objective"
    t.string   "code"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "vitaes", ["user_id"], name: "index_vitaes_on_user_id"

end
