# encoding: UTF-8
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

ActiveRecord::Schema.define(version: 20160215124158) do

  create_table "boards", force: :cascade do |t|
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.integer  "boardable_id"
    t.string   "boardable_type"
  end

  create_table "documents", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "project_id"
  end

  add_index "documents", ["project_id"], name: "index_documents_on_project_id"

  create_table "posts", force: :cascade do |t|
    t.string   "content"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "board_id"
    t.integer  "version_id"
  end

  add_index "posts", ["board_id"], name: "index_posts_on_board_id"
  add_index "posts", ["version_id"], name: "index_posts_on_version_id"

  create_table "projects", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "versions", force: :cascade do |t|
    t.integer  "version_no"
    t.integer  "document_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "versions", ["document_id"], name: "index_versions_on_document_id"

end
