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

ActiveRecord::Schema.define(version: 2021_09_10_101338) do

  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.integer "record_id", null: false
    t.integer "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.bigint "byte_size", null: false
    t.string "checksum", null: false
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "admins", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_admins_on_email", unique: true
    t.index ["reset_password_token"], name: "index_admins_on_reset_password_token", unique: true
  end

  create_table "artworks", force: :cascade do |t|
    t.integer "creator_id"
    t.text "description", limit: 1000
    t.boolean "is_private", default: false, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["creator_id"], name: "index_artworks_on_creator_id"
  end

  create_table "contacts", force: :cascade do |t|
    t.integer "creator_id"
    t.integer "musician_id"
    t.text "content", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["creator_id"], name: "index_contacts_on_creator_id"
    t.index ["musician_id"], name: "index_contacts_on_musician_id"
  end

  create_table "creators", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "last_name", limit: 15, null: false
    t.string "first_name", limit: 15, null: false
    t.string "last_name_kana", limit: 15, null: false
    t.string "first_name_kana", limit: 15, null: false
    t.string "nickname", limit: 20, null: false
    t.string "phone_number", null: false
    t.text "schedule", limit: 200
    t.text "price", limit: 200
    t.text "introduction", limit: 1000
    t.boolean "is_deleted", default: false, null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_creators_on_email", unique: true
    t.index ["nickname"], name: "index_creators_on_nickname", unique: true
    t.index ["reset_password_token"], name: "index_creators_on_reset_password_token", unique: true
  end

  create_table "entries", force: :cascade do |t|
    t.integer "creator_id"
    t.integer "recruitment_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["creator_id"], name: "index_entries_on_creator_id"
    t.index ["recruitment_id"], name: "index_entries_on_recruitment_id"
  end

  create_table "favorites", force: :cascade do |t|
    t.integer "creator_id"
    t.integer "musician_id"
    t.integer "recruitment_id"
    t.string "subject", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["creator_id"], name: "index_favorites_on_creator_id"
    t.index ["musician_id"], name: "index_favorites_on_musician_id"
    t.index ["recruitment_id"], name: "index_favorites_on_recruitment_id"
  end

  create_table "issues", force: :cascade do |t|
    t.integer "recruitment_id"
    t.integer "creator_id"
    t.integer "musician_id"
    t.integer "status", default: 0, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["creator_id"], name: "index_issues_on_creator_id"
    t.index ["musician_id"], name: "index_issues_on_musician_id"
    t.index ["recruitment_id"], name: "index_issues_on_recruitment_id"
  end

  create_table "messages", force: :cascade do |t|
    t.integer "creator_id"
    t.integer "musician_id"
    t.integer "issue_id"
    t.text "content", limit: 5000
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["creator_id"], name: "index_messages_on_creator_id"
    t.index ["issue_id"], name: "index_messages_on_issue_id"
    t.index ["musician_id"], name: "index_messages_on_musician_id"
  end

  create_table "musicians", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "last_name", limit: 15, null: false
    t.string "first_name", limit: 15, null: false
    t.string "last_name_kana", limit: 15, null: false
    t.string "first_name_kana", limit: 15, null: false
    t.string "nickname", limit: 20, null: false
    t.string "phone_number", null: false
    t.text "introduction", limit: 1000
    t.boolean "is_deleted", default: false, null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_musicians_on_email", unique: true
    t.index ["nickname"], name: "index_musicians_on_nickname", unique: true
    t.index ["reset_password_token"], name: "index_musicians_on_reset_password_token", unique: true
  end

  create_table "notifications", force: :cascade do |t|
    t.integer "visitor_creator_id"
    t.integer "visited_creator_id"
    t.integer "visitor_musician_id"
    t.integer "visited_musician_id"
    t.integer "message_id"
    t.integer "issue_id"
    t.integer "entry_id"
    t.boolean "checked", default: false, null: false
    t.string "action", null: false
    t.boolean "is_musician", default: false, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["entry_id"], name: "index_notifications_on_entry_id"
    t.index ["issue_id"], name: "index_notifications_on_issue_id"
    t.index ["message_id"], name: "index_notifications_on_message_id"
  end

  create_table "recruitment_postscripts", force: :cascade do |t|
    t.text "postscript", limit: 2000, null: false
    t.integer "musician_id"
    t.integer "recruitment_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["musician_id"], name: "index_recruitment_postscripts_on_musician_id"
    t.index ["recruitment_id"], name: "index_recruitment_postscripts_on_recruitment_id"
  end

  create_table "recruitments", force: :cascade do |t|
    t.integer "musician_id"
    t.string "title", limit: 200, null: false
    t.text "detail", limit: 2000, null: false
    t.date "deadline", null: false
    t.integer "price", null: false
    t.boolean "is_closed", default: false, null: false
    t.boolean "is_private", default: false, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["musician_id"], name: "index_recruitments_on_musician_id"
  end

end
