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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20120529203550) do

  create_table "authorizations", :force => true do |t|
    t.string   "provider"
    t.string   "uid"
    t.integer  "user_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "daily_wods", :force => true do |t|
    t.date     "date"
    t.text     "description"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
    t.string   "title"
  end

  create_table "events", :force => true do |t|
    t.string   "name"
    t.datetime "start_at"
    t.datetime "end_at"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "exercise_workouts", :force => true do |t|
    t.integer  "exercise_id", :null => false
    t.integer  "workout_id",  :null => false
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  add_index "exercise_workouts", ["exercise_id"], :name => "index_exercise_workouts_on_exercise_id"
  add_index "exercise_workouts", ["workout_id"], :name => "index_exercise_workouts_on_workout_id"

  create_table "exercises", :force => true do |t|
    t.integer  "repetitions"
    t.integer  "weight"
    t.integer  "rounds"
    t.integer  "distance"
    t.string   "units"
    t.datetime "created_at",       :null => false
    t.datetime "updated_at",       :null => false
    t.integer  "exercise_type_id"
    t.text     "description"
    t.string   "category"
  end

  create_table "goals", :force => true do |t|
    t.string   "name",        :null => false
    t.text     "description", :null => false
    t.string   "status",      :null => false
    t.date     "deadline",    :null => false
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
    t.integer  "user_id"
  end

  create_table "health_records", :force => true do |t|
    t.date     "date_recorded",      :null => false
    t.integer  "systolic_bp"
    t.integer  "diastolic_bp"
    t.integer  "weight"
    t.integer  "resting_heart_rate"
    t.integer  "calories_consumed"
    t.datetime "created_at",         :null => false
    t.datetime "updated_at",         :null => false
    t.integer  "user_id"
  end

  create_table "injury_records", :force => true do |t|
    t.string   "name",                        :null => false
    t.date     "start_date",                  :null => false
    t.date     "end_date"
    t.text     "description", :default => "", :null => false
    t.integer  "severity",                    :null => false
    t.datetime "created_at",                  :null => false
    t.datetime "updated_at",                  :null => false
    t.integer  "user_id"
  end

  create_table "personal_records", :force => true do |t|
    t.datetime "created_at",        :null => false
    t.datetime "updated_at",        :null => false
    t.integer  "user_id"
    t.integer  "workout_record_id"
  end

  create_table "profiles", :force => true do |t|
    t.string   "first_name",                  :null => false
    t.string   "last_name",                   :null => false
    t.integer  "height",                      :null => false
    t.integer  "weight",                      :null => false
    t.date     "birthdate",                   :null => false
    t.text     "description", :default => "", :null => false
    t.datetime "created_at",                  :null => false
    t.datetime "updated_at",                  :null => false
    t.integer  "user_id"
    t.string   "picture"
    t.string   "gender"
  end

  create_table "sessions", :force => true do |t|
    t.string   "session_id", :null => false
    t.text     "data"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "sessions", ["session_id"], :name => "index_sessions_on_session_id"
  add_index "sessions", ["updated_at"], :name => "index_sessions_on_updated_at"

  create_table "trainers", :force => true do |t|
    t.string   "name",       :null => false
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "users", :force => true do |t|
    t.string   "email"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.string   "username"
  end

  create_table "workout_records", :force => true do |t|
    t.date     "date_performed",                 :null => false
    t.text     "note",           :default => ""
    t.integer  "points"
    t.integer  "time"
    t.integer  "rounds"
    t.datetime "created_at",                     :null => false
    t.datetime "updated_at",                     :null => false
    t.integer  "user_id"
    t.integer  "workout_id"
    t.integer  "trainer_id"
  end

  create_table "workouts", :force => true do |t|
    t.string   "name",            :null => false
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
    t.integer  "workout_type_id"
    t.text     "description"
    t.string   "category"
  end

end
