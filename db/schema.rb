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

ActiveRecord::Schema.define(version: 20170303102803) do

  create_table "attendances", force: :cascade do |t|
    t.integer  "student_id"
    t.integer  "meeting_id"
    t.integer  "subject_id"
    t.string   "status",     default: "present"
    t.datetime "created_at",                     null: false
    t.datetime "updated_at",                     null: false
  end

  create_table "meetings", force: :cascade do |t|
    t.integer  "subject_id"
    t.string   "meeting_type", default: "Regular"
    t.date     "date"
    t.time     "start_time"
    t.time     "end_time"
    t.text     "remarks"
    t.datetime "created_at",                       null: false
    t.datetime "updated_at",                       null: false
  end

  create_table "students", force: :cascade do |t|
    t.integer  "subject_id"
    t.integer  "id_number"
    t.string   "first_name"
    t.string   "middle_name"
    t.string   "last_name"
    t.string   "suffix"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "subjects", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "course_code"
    t.string   "course_name"
    t.string   "section"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "username"
    t.string   "email"
    t.string   "password_digest"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

end
