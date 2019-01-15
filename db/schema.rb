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

ActiveRecord::Schema.define(version: 2019_01_15_160425) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "autors", force: :cascade do |t|
    t.string "name1"
    t.string "name2"
    t.string "lastname1"
    t.string "lastname2"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_id"
    t.index ["user_id"], name: "index_autors_on_user_id"
  end

  create_table "books", force: :cascade do |t|
    t.string "title"
    t.string "editorial"
    t.string "city"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "autor_id"
    t.bigint "user_id"
    t.text "notes"
    t.index ["autor_id"], name: "index_books_on_autor_id"
    t.index ["user_id"], name: "index_books_on_user_id"
  end

  create_table "books_topics", id: false, force: :cascade do |t|
    t.bigint "topic_id"
    t.bigint "book_id"
    t.index ["book_id"], name: "index_books_topics_on_book_id"
    t.index ["topic_id"], name: "index_books_topics_on_topic_id"
  end

  create_table "cites", force: :cascade do |t|
    t.text "content"
    t.bigint "book_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["book_id"], name: "index_cites_on_book_id"
  end

  create_table "topics", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_id"
    t.index ["user_id"], name: "index_topics_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "autors", "users"
  add_foreign_key "books", "autors"
  add_foreign_key "books", "users"
  add_foreign_key "books_topics", "books"
  add_foreign_key "books_topics", "topics"
  add_foreign_key "cites", "books"
  add_foreign_key "topics", "users"
end
