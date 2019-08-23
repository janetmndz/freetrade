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

ActiveRecord::Schema.define(version: 2019_08_23_144315) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "items", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.string "condition"
    t.string "category"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "image_url"
    t.boolean "trade", default: true
    t.index ["user_id"], name: "index_items_on_user_id"
  end

  create_table "offers", force: :cascade do |t|
    t.datetime "date"
    t.boolean "status"
    t.integer "wanted_item_id"
    t.integer "offered_item_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["offered_item_id"], name: "index_offers_on_offered_item_id"
    t.index ["wanted_item_id"], name: "index_offers_on_wanted_item_id"
  end

  create_table "question_answers", force: :cascade do |t|
    t.string "question"
    t.string "answer"
    t.bigint "item_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["item_id"], name: "index_question_answers_on_item_id"
  end

  create_table "reviews", force: :cascade do |t|
    t.integer "reviewee_id"
    t.integer "reviewer_id"
    t.text "review"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["reviewee_id"], name: "index_reviews_on_reviewee_id"
    t.index ["reviewer_id"], name: "index_reviews_on_reviewer_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.integer "age"
    t.string "location"
    t.text "bio"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "password_digest"
  end

  add_foreign_key "items", "users"
  add_foreign_key "offers", "items", column: "offered_item_id"
  add_foreign_key "offers", "items", column: "wanted_item_id"
  add_foreign_key "question_answers", "items"
  add_foreign_key "reviews", "users", column: "reviewee_id"
  add_foreign_key "reviews", "users", column: "reviewer_id"
end
