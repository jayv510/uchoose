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

ActiveRecord::Schema.define(version: 2018_12_03_025157) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

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
    t.integer "average_review"
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

  create_table "review_mentors", force: :cascade do |t|
    t.text "content"
    t.integer "rating"
    t.bigint "mentor_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "prospective_id"
    t.index ["mentor_id"], name: "index_review_mentors_on_mentor_id"
    t.index ["prospective_id"], name: "index_review_mentors_on_prospective_id"
  end

  add_foreign_key "review_mentors", "mentors"
  add_foreign_key "review_mentors", "prospectives"
end
