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

ActiveRecord::Schema.define(version: 20130822045952) do

  create_table "cases", force: true do |t|
    t.integer  "user_id"
    t.integer  "client_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "cases", ["client_id"], name: "index_cases_on_client_id"
  add_index "cases", ["user_id"], name: "index_cases_on_user_id"

  create_table "clients", force: true do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.date     "date_of_birth"
    t.string   "gender"
    t.string   "hcn"
    t.string   "physician"
    t.string   "physician_phone"
    t.text     "diagnosis"
    t.text     "advanced_directives"
    t.string   "address"
    t.string   "contact_name"
    t.string   "contact_phone"
    t.string   "contact_relationship"
    t.string   "image"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "follow_ups", force: true do |t|
    t.string   "task"
    t.boolean  "completed",        default: false
    t.integer  "assigned_user_id"
    t.integer  "user_id"
    t.integer  "note_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "notes", force: true do |t|
    t.string   "title"
    t.text     "description"
    t.string   "importance"
    t.integer  "user_id"
    t.integer  "client_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "notes", ["client_id"], name: "index_notes_on_client_id"
  add_index "notes", ["user_id"], name: "index_notes_on_user_id"

  create_table "users", force: true do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "designation"
    t.string   "phone"
    t.string   "email"
    t.string   "password_digest"
    t.string   "username"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "vitals", force: true do |t|
    t.string   "weight"
    t.string   "height"
    t.string   "systolic"
    t.string   "diastolic"
    t.string   "beats"
    t.string   "beats_location"
    t.string   "beats_condition"
    t.string   "blood_sugar"
    t.string   "bs_condition"
    t.string   "breaths"
    t.string   "breaths_condition"
    t.string   "breaths_description"
    t.string   "temperature"
    t.integer  "user_id"
    t.integer  "client_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "vitals", ["client_id"], name: "index_vitals_on_client_id"
  add_index "vitals", ["user_id"], name: "index_vitals_on_user_id"

end
