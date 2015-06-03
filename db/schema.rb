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

ActiveRecord::Schema.define(version: 20150603052122) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"
  enable_extension "uuid-ossp"

  create_table "friendly_id_slugs", force: :cascade do |t|
    t.string   "slug",                      null: false
    t.integer  "sluggable_id",              null: false
    t.string   "sluggable_type", limit: 50
    t.string   "scope"
    t.datetime "created_at"
  end

  add_index "friendly_id_slugs", ["slug", "sluggable_type", "scope"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type_and_scope", unique: true, using: :btree
  add_index "friendly_id_slugs", ["slug", "sluggable_type"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type", using: :btree
  add_index "friendly_id_slugs", ["sluggable_id"], name: "index_friendly_id_slugs_on_sluggable_id", using: :btree
  add_index "friendly_id_slugs", ["sluggable_type"], name: "index_friendly_id_slugs_on_sluggable_type", using: :btree

  create_table "gaming_groups", id: :uuid, default: "uuid_generate_v4()", force: :cascade do |t|
    t.string   "name"
    t.text     "description"
    t.integer  "shared_with", default: 0
    t.string   "slug",                    null: false
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  add_index "gaming_groups", ["slug"], name: "index_gaming_groups_on_slug", unique: true, using: :btree

  create_table "group_members", id: false, force: :cascade do |t|
    t.uuid    "player_id"
    t.uuid    "gaming_group_id"
    t.integer "role",            default: 0
  end

  add_index "group_members", ["gaming_group_id"], name: "index_group_members_on_gaming_group_id", using: :btree
  add_index "group_members", ["player_id"], name: "index_group_members_on_player_id", using: :btree

  create_table "player_accounts", id: :uuid, default: "uuid_generate_v4()", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
  end

  add_index "player_accounts", ["confirmation_token"], name: "index_player_accounts_on_confirmation_token", unique: true, using: :btree
  add_index "player_accounts", ["email"], name: "index_player_accounts_on_email", unique: true, using: :btree
  add_index "player_accounts", ["reset_password_token"], name: "index_player_accounts_on_reset_password_token", unique: true, using: :btree

  create_table "players", id: :uuid, default: "uuid_generate_v4()", force: :cascade do |t|
    t.string   "name"
    t.uuid     "player_account_id"
    t.boolean  "public_email",      default: false
    t.string   "gravatar_email"
    t.string   "slug",                              null: false
    t.integer  "shared_with",       default: 0
    t.datetime "created_at",                        null: false
    t.datetime "updated_at",                        null: false
  end

  add_index "players", ["player_account_id"], name: "index_players_on_player_account_id", using: :btree
  add_index "players", ["slug"], name: "index_players_on_slug", unique: true, using: :btree

end
