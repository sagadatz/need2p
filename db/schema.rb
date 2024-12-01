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

ActiveRecord::Schema[7.1].define(version: 2024_12_02_132453) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "categories", force: :cascade do |t|
    t.string "name"
    t.string "icon"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "reviews", force: :cascade do |t|
    t.string "title"
    t.text "content"
    t.integer "rating"
    t.bigint "user_id", null: false
    t.bigint "toilet_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "clean"
    t.boolean "dirty"
    t.boolean "accessible"
    t.boolean "paid_entry"
    t.boolean "female_friendly"
    t.boolean "well_located"
    t.boolean "handicap_friendly"
    t.boolean "family_friendly"
    t.index ["toilet_id"], name: "index_reviews_on_toilet_id"
    t.index ["user_id"], name: "index_reviews_on_user_id"
  end

  create_table "toilet_categories", force: :cascade do |t|
    t.bigint "toilet_id", null: false
    t.bigint "category_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["category_id"], name: "index_toilet_categories_on_category_id"
    t.index ["toilet_id"], name: "index_toilet_categories_on_toilet_id"
  end

  create_table "toilets", force: :cascade do |t|
    t.string "location"
    t.boolean "available"
    t.float "longitude"
    t.float "latitude"
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "name"
    t.string "address"
    t.index ["user_id"], name: "index_toilets_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "username", default: "John Wick", null: false
    t.string "name"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "reviews", "toilets"
  add_foreign_key "reviews", "users"
  add_foreign_key "toilet_categories", "categories"
  add_foreign_key "toilet_categories", "toilets"
  add_foreign_key "toilets", "users"
end
