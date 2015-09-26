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

ActiveRecord::Schema.define(version: 20150926022212) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "completed_steps", force: :cascade do |t|
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "step_id"
  end

  add_index "completed_steps", ["step_id"], name: "index_completed_steps_on_step_id", using: :btree
  add_index "completed_steps", ["user_id"], name: "index_completed_steps_on_user_id", using: :btree

  create_table "fitness_plans", force: :cascade do |t|
    t.integer  "race_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.string   "plan_title"
    t.string   "plan_summary"
  end

  add_index "fitness_plans", ["race_id"], name: "index_fitness_plans_on_race_id", using: :btree

  create_table "races", force: :cascade do |t|
    t.string   "name"
    t.string   "start_location"
    t.string   "end_location"
    t.string   "date"
    t.string   "distance"
    t.string   "cost"
    t.string   "map"
    t.string   "elevation"
    t.string   "checkpoints"
    t.datetime "created_at",                                       null: false
    t.datetime "updated_at",                                       null: false
    t.string   "image_url",      default: "placeholder_image.png"
    t.string   "about"
    t.string   "transportation"
    t.string   "about_url"
  end

  create_table "steps", force: :cascade do |t|
    t.integer  "fitness_plan_id"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.string   "title"
    t.string   "summary"
    t.string   "date"
    t.string   "difficulty"
  end

  add_index "steps", ["fitness_plan_id"], name: "index_steps_on_fitness_plan_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "",                       null: false
    t.string   "encrypted_password",     default: "",                       null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,                        null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at",                                                null: false
    t.datetime "updated_at",                                                null: false
    t.string   "provider"
    t.string   "uid"
    t.string   "fitbit_token"
    t.string   "fitbit_secret"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "image_url",              default: "default_user_image.png"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  create_table "users_races", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "race_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "users_races", ["race_id"], name: "index_users_races_on_race_id", using: :btree
  add_index "users_races", ["user_id"], name: "index_users_races_on_user_id", using: :btree

  add_foreign_key "completed_steps", "steps"
  add_foreign_key "completed_steps", "users"
  add_foreign_key "fitness_plans", "races"
  add_foreign_key "steps", "fitness_plans"
  add_foreign_key "users_races", "races"
  add_foreign_key "users_races", "users"
end
