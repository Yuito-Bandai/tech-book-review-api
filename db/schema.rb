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

ActiveRecord::Schema[7.0].define(version: 2024_12_30_180413) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "bookmarks", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "book_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["book_id"], name: "index_bookmarks_on_book_id"
    t.index ["user_id"], name: "index_bookmarks_on_user_id"
  end

  create_table "books", force: :cascade do |t|
    t.string "title"
    t.string "author"
    t.text "description"
    t.date "published_at"
    t.bigint "category_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["category_id"], name: "index_books_on_category_id"
  end

  create_table "books_tags", id: false, force: :cascade do |t|
    t.bigint "book_id", null: false
    t.bigint "tag_id", null: false
    t.index ["book_id", "tag_id"], name: "index_books_tags_on_book_id_and_tag_id"
    t.index ["tag_id", "book_id"], name: "index_books_tags_on_tag_id_and_book_id"
  end

  create_table "categories", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "reviews", force: :cascade do |t|
    t.integer "rating"
    t.text "content"
    t.bigint "book_id", null: false
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["book_id"], name: "index_reviews_on_book_id"
    t.index ["user_id"], name: "index_reviews_on_user_id"
  end

  create_table "tags", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "username"
    t.string "email"
    t.string "password_digest"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "bookmarks", "books"
  add_foreign_key "bookmarks", "users"
  add_foreign_key "books", "categories"
  add_foreign_key "reviews", "books"
  add_foreign_key "reviews", "users"
end