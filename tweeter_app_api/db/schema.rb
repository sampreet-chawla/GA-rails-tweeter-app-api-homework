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

ActiveRecord::Schema.define(version: 2020_11_11_214929) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "replies", force: :cascade do |t|
    t.string "message"
    t.bigint "tweet_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["tweet_id"], name: "index_replies_on_tweet_id"
  end

  create_table "tweets", force: :cascade do |t|
    t.string "title"
    t.text "content", default: "Pending content"
    t.string "author"
  end

  add_foreign_key "replies", "tweets"
end
