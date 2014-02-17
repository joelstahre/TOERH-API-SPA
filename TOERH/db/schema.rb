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

ActiveRecord::Schema.define(version: 20140216135227) do

  create_table "admins", force: true do |t|
    t.string   "first_name",      null: false
    t.string   "last_name",       null: false
    t.string   "admin_email",     null: false
    t.string   "username",        null: false
    t.string   "password_digest", null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "api_keys", force: true do |t|
    t.string   "auth_token", default: ""
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "revoked",    default: false, null: false
  end

  create_table "applications", force: true do |t|
    t.integer  "api_key_id"
    t.string   "contact_mail",            null: false
    t.string   "app_name",     limit: 20, null: false
    t.text     "app_desc",                null: false
    t.string   "owner_name",   limit: 20, null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "licences", force: true do |t|
    t.string   "licence",     null: false
    t.string   "description", null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "resource_types", force: true do |t|
    t.string   "resource_type", null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "resources", force: true do |t|
    t.integer  "user_id"
    t.integer  "resource_type_id"
    t.integer  "licence_id"
    t.string   "title",            null: false
    t.string   "desciption"
    t.string   "url",              null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "resources_tags", id: false, force: true do |t|
    t.integer "tag_id"
    t.integer "resource_id"
  end

  add_index "resources_tags", ["tag_id", "resource_id"], name: "index_resources_tags_on_tag_id_and_resource_id"

  create_table "tags", force: true do |t|
    t.string   "tag",        null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.string   "first_name", null: false
    t.string   "last_name",  null: false
    t.string   "email",      null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
