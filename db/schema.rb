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

ActiveRecord::Schema.define(version: 20150818002139) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "competencies", force: :cascade do |t|
    t.string   "name"
    t.string   "color"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "competency_users", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "competency_id"
    t.integer  "rank"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  add_index "competency_users", ["competency_id"], name: "index_competency_users_on_competency_id", using: :btree
  add_index "competency_users", ["user_id"], name: "index_competency_users_on_user_id", using: :btree

  create_table "contents", force: :cascade do |t|
    t.integer  "hive_id"
    t.integer  "competency_id"
    t.string   "data"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  add_index "contents", ["competency_id"], name: "index_contents_on_competency_id", using: :btree
  add_index "contents", ["hive_id"], name: "index_contents_on_hive_id", using: :btree

  create_table "hive_users", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "hive_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "hive_users", ["hive_id"], name: "index_hive_users_on_hive_id", using: :btree
  add_index "hive_users", ["user_id"], name: "index_hive_users_on_user_id", using: :btree

  create_table "hives", force: :cascade do |t|
    t.integer  "question_id"
    t.string   "name"
    t.boolean  "solo",        default: false
    t.boolean  "completed",   default: false
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
  end

  add_index "hives", ["question_id"], name: "index_hives_on_question_id", using: :btree

  create_table "messages", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "hive_id"
    t.string   "body"
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
    t.boolean  "hived",      default: false
  end

  create_table "questions", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "inquiry"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "questions", ["user_id"], name: "index_questions_on_user_id", using: :btree

  create_table "rhythm_users", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "rhythm_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "rhythm_users", ["rhythm_id"], name: "index_rhythm_users_on_rhythm_id", using: :btree
  add_index "rhythm_users", ["user_id"], name: "index_rhythm_users_on_user_id", using: :btree

  create_table "rhythms", force: :cascade do |t|
    t.string   "name"
    t.string   "color"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "uid"
    t.string   "name"
    t.string   "image_url"
    t.string   "email"
    t.string   "city"
    t.string   "country"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
