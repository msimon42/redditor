# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2021_02_23_171342) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "bots", force: :cascade do |t|
    t.string "username"
    t.string "password"
    t.string "recovery_email"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "user_agent"
    t.integer "comment_karma"
  end

  create_table "buzzwords", force: :cascade do |t|
    t.string "word"
    t.float "value"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "comments", force: :cascade do |t|
    t.string "text"
    t.bigint "sub_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "author"
    t.integer "score"
    t.string "submission_id"
    t.boolean "bot_post"
    t.index ["sub_id"], name: "index_comments_on_sub_id"
  end

  create_table "posts", force: :cascade do |t|
    t.string "title"
    t.string "text"
    t.bigint "sub_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "author"
    t.integer "score"
    t.string "submission_id"
    t.boolean "bot_post"
    t.index ["sub_id"], name: "index_posts_on_sub_id"
  end

  create_table "subs", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.boolean "crypto"
  end

  add_foreign_key "comments", "subs"
  add_foreign_key "posts", "subs"
end
