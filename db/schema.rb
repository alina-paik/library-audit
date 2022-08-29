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

ActiveRecord::Schema.define(version: 2022_08_29_134550) do

  create_table "authors", force: :cascade do |t|
    t.integer "users_id"
    t.string "name", default: "", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["users_id"], name: "index_authors_on_users_id"
  end

  create_table "authors_books", force: :cascade do |t|
    t.integer "books_id"
    t.integer "authors_id"
    t.index ["authors_id"], name: "index_authors_books_on_authors_id"
    t.index ["books_id"], name: "index_authors_books_on_books_id"
  end

  create_table "books", force: :cascade do |t|
    t.integer "authors_id"
    t.integer "categories_id"
    t.string "name", default: "", null: false
    t.string "description", default: "", null: false
    t.string "title_image"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["authors_id"], name: "index_books_on_authors_id"
    t.index ["categories_id"], name: "index_books_on_categories_id"
  end

  create_table "books_categories", force: :cascade do |t|
    t.integer "books_id"
    t.integer "categories_id"
    t.index ["books_id"], name: "index_books_categories_on_books_id"
    t.index ["categories_id"], name: "index_books_categories_on_categories_id"
  end

  create_table "categories", force: :cascade do |t|
    t.string "name", default: "", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "comments", force: :cascade do |t|
    t.integer "books_id"
    t.integer "users_id"
    t.string "value", default: "", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["books_id"], name: "index_comments_on_books_id"
    t.index ["users_id"], name: "index_comments_on_users_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "username", default: "", null: false
    t.string "email", default: "", null: false
    t.string "password", default: "", null: false
    t.string "phone_number", default: "", null: false
    t.boolean "admin", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["phone_number"], name: "index_users_on_phone_number", unique: true
  end

end
