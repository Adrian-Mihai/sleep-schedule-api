# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2021_11_21_202828) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "activity_sessions", force: :cascade do |t|
    t.string "uuid", null: false
    t.bigint "user_id"
    t.date "date", null: false
    t.float "active_time", null: false
    t.float "calories", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["date"], name: "index_activity_sessions_on_date", unique: true
    t.index ["user_id"], name: "index_activity_sessions_on_user_id"
    t.index ["uuid"], name: "index_activity_sessions_on_uuid", unique: true
  end

  create_table "sleep_sessions", force: :cascade do |t|
    t.string "uuid", null: false
    t.bigint "user_id"
    t.date "date", null: false
    t.datetime "went_to_bed", null: false
    t.datetime "woke_up", null: false
    t.integer "sleep_quality", null: false
    t.float "time_in_bed", null: false
    t.float "movements_per_hour", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["date"], name: "index_sleep_sessions_on_date", unique: true
    t.index ["user_id"], name: "index_sleep_sessions_on_user_id"
    t.index ["uuid"], name: "index_sleep_sessions_on_uuid", unique: true
  end

  create_table "users", force: :cascade do |t|
    t.string "uuid", null: false
    t.string "email", null: false
    t.string "password_digest"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["uuid"], name: "index_users_on_uuid", unique: true
  end

  add_foreign_key "activity_sessions", "users"
  add_foreign_key "sleep_sessions", "users"
end
