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

ActiveRecord::Schema.define(version: 2018_11_28_023803) do
ActiveRecord::Schema.define(version: 2018_11_27_072439) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "bookings", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "prospectives_id"
    t.bigint "mentors_id"
    t.datetime "start_datetime"
    t.datetime "end_datetime"
    t.decimal "total_cost"
    t.index ["mentors_id"], name: "index_bookings_on_mentors_id"
    t.index ["prospectives_id"], name: "index_bookings_on_prospectives_id"
  end

  create_table "mentors", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "first_name"
    t.string "last_name"
    t.string "nationality"
    t.string "university"
    t.string "major"
    t.string "degree_level"
    t.text "description"
    t.integer "rate"
    t.text "description_two"
    t.string "major_category"
    t.string "photo"
    t.index ["email"], name: "index_mentors_on_email", unique: true
    t.index ["reset_password_token"], name: "index_mentors_on_reset_password_token", unique: true
  end

  create_table "prospectives", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "first_name"
    t.string "last_name"
    t.string "nationality"
    t.string "photo"
    t.index ["email"], name: "index_prospectives_on_email", unique: true
    t.index ["reset_password_token"], name: "index_prospectives_on_reset_password_token", unique: true
  end

  create_table "reviews", force: :cascade do |t|
    t.integer "rating"
    t.text "comment"
    t.bigint "bookings_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["bookings_id"], name: "index_reviews_on_bookings_id"
  end

  add_foreign_key "bookings", "mentors", column: "mentors_id"
  add_foreign_key "bookings", "prospectives", column: "prospectives_id"
  add_foreign_key "reviews", "bookings", column: "bookings_id"
end
