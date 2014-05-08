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

ActiveRecord::Schema.define(version: 20140508024658) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "active_admin_comments", force: true do |t|
    t.string   "namespace"
    t.text     "body"
    t.string   "resource_id",   null: false
    t.string   "resource_type", null: false
    t.integer  "author_id"
    t.string   "author_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "active_admin_comments", ["author_type", "author_id"], name: "index_active_admin_comments_on_author_type_and_author_id", using: :btree
  add_index "active_admin_comments", ["namespace"], name: "index_active_admin_comments_on_namespace", using: :btree
  add_index "active_admin_comments", ["resource_type", "resource_id"], name: "index_active_admin_comments_on_resource_type_and_resource_id", using: :btree

  create_table "admin_users", force: true do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "admin_users", ["email"], name: "index_admin_users_on_email", unique: true, using: :btree
  add_index "admin_users", ["reset_password_token"], name: "index_admin_users_on_reset_password_token", unique: true, using: :btree

  create_table "answers", force: true do |t|
    t.integer  "certification_id"
    t.integer  "question_id"
    t.boolean  "value",            default: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "attachments", force: true do |t|
    t.string   "comment"
    t.string   "url"
    t.string   "filename"
    t.string   "filepath"
    t.string   "filesize"
    t.string   "filetype"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "answer_id"
  end

  create_table "certifications", force: true do |t|
    t.integer  "user_id"
    t.string   "state"
    t.datetime "approval_date"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.datetime "accepted_contract_at"
  end

  create_table "profiles", force: true do |t|
    t.integer "user_id"
    t.string  "name"
    t.string  "address"
    t.string  "city"
    t.string  "postal_code"
    t.string  "telephone"
    t.string  "fax"
    t.string  "website"
    t.string  "member_number"
    t.string  "establishment_type"
    t.string  "classification"
    t.string  "number_of_rooms"
    t.string  "member_since"
    t.string  "director_name"
    t.string  "director_title"
    t.string  "director_phone"
    t.string  "director_email"
    t.string  "manager_name"
    t.string  "manager_title"
    t.string  "manager_phone"
    t.string  "manager_email"
  end

  create_table "questions", force: true do |t|
    t.string   "title"
    t.string   "question_fr",   limit: 512
    t.string   "proof_fr",      limit: 1300
    t.string   "widget_fr",     limit: 512
    t.string   "widget_en",     limit: 512
    t.string   "help_fr",       limit: 1300
    t.boolean  "renewable"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "sort_order"
    t.integer  "section_id"
    t.integer  "subsection_id"
    t.integer  "patch_version"
  end

  create_table "sections", force: true do |t|
    t.integer  "section_id"
    t.integer  "subsection_id"
    t.string   "title_fr"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.string   "email"
    t.string   "encrypted_password",      default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",           default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "last_visited_section_id"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

end
