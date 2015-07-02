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

ActiveRecord::Schema.define(version: 20150622014744) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"
  enable_extension "uuid-ossp"

  create_table "bgg_artists", force: :cascade do |t|
    t.string   "name"
    t.integer  "game_summary_artists_count", default: 0
    t.datetime "created_at",                             null: false
    t.datetime "updated_at",                             null: false
  end

  create_table "bgg_categories", force: :cascade do |t|
    t.string   "name"
    t.integer  "game_summary_categories_count", default: 0
    t.datetime "created_at",                                null: false
    t.datetime "updated_at",                                null: false
  end

  create_table "bgg_designers", force: :cascade do |t|
    t.string   "name"
    t.integer  "game_summary_designers_count", default: 0
    t.datetime "created_at",                               null: false
    t.datetime "updated_at",                               null: false
  end

  create_table "bgg_families", force: :cascade do |t|
    t.string   "name"
    t.integer  "game_summary_families_count", default: 0
    t.datetime "created_at",                              null: false
    t.datetime "updated_at",                              null: false
  end

  create_table "bgg_mechanics", force: :cascade do |t|
    t.string   "name"
    t.integer  "game_summary_mechanics_count", default: 0
    t.datetime "created_at",                               null: false
    t.datetime "updated_at",                               null: false
  end

  create_table "bgg_publishers", force: :cascade do |t|
    t.string   "name"
    t.integer  "game_summary_publishers_count", default: 0
    t.datetime "created_at",                                null: false
    t.datetime "updated_at",                                null: false
  end

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

  create_table "game_libraries", force: :cascade do |t|
    t.uuid     "player_id"
    t.string   "name",       null: false
    t.string   "slug",       null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "game_libraries", ["player_id"], name: "index_game_libraries_on_player_id", using: :btree
  add_index "game_libraries", ["slug"], name: "index_game_libraries_on_slug", unique: true, using: :btree

  create_table "game_library_items", force: :cascade do |t|
    t.integer  "game_library_id"
    t.integer  "game_summary_id"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  add_index "game_library_items", ["game_library_id", "game_summary_id"], name: "index_game_library_items_on_game_library_id_and_game_summary_id", unique: true, using: :btree
  add_index "game_library_items", ["game_library_id"], name: "index_game_library_items_on_game_library_id", using: :btree
  add_index "game_library_items", ["game_summary_id"], name: "index_game_library_items_on_game_summary_id", using: :btree

  create_table "game_summaries", force: :cascade do |t|
    t.string   "name"
    t.string   "thumbnail_url"
    t.string   "image_url"
    t.integer  "year_published"
    t.integer  "max_players"
    t.integer  "min_players"
    t.integer  "playing_time"
    t.text     "description"
    t.integer  "game_library_items_count", default: 0
    t.datetime "created_at",                           null: false
    t.datetime "updated_at",                           null: false
  end

  create_table "game_summary_artists", force: :cascade do |t|
    t.integer  "game_summary_id"
    t.integer  "bgg_artist_id"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  add_index "game_summary_artists", ["bgg_artist_id"], name: "index_game_summary_artists_on_bgg_artist_id", using: :btree
  add_index "game_summary_artists", ["game_summary_id"], name: "index_game_summary_artists_on_game_summary_id", using: :btree

  create_table "game_summary_categories", force: :cascade do |t|
    t.integer  "game_summary_id"
    t.integer  "bgg_category_id"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  add_index "game_summary_categories", ["bgg_category_id"], name: "index_game_summary_categories_on_bgg_category_id", using: :btree
  add_index "game_summary_categories", ["game_summary_id"], name: "index_game_summary_categories_on_game_summary_id", using: :btree

  create_table "game_summary_designers", force: :cascade do |t|
    t.integer  "game_summary_id"
    t.integer  "bgg_designer_id"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  add_index "game_summary_designers", ["bgg_designer_id"], name: "index_game_summary_designers_on_bgg_designer_id", using: :btree
  add_index "game_summary_designers", ["game_summary_id"], name: "index_game_summary_designers_on_game_summary_id", using: :btree

  create_table "game_summary_families", force: :cascade do |t|
    t.integer  "game_summary_id"
    t.integer  "bgg_family_id"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  add_index "game_summary_families", ["bgg_family_id"], name: "index_game_summary_families_on_bgg_family_id", using: :btree
  add_index "game_summary_families", ["game_summary_id"], name: "index_game_summary_families_on_game_summary_id", using: :btree

  create_table "game_summary_mechanics", force: :cascade do |t|
    t.integer  "game_summary_id"
    t.integer  "bgg_mechanic_id"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  add_index "game_summary_mechanics", ["bgg_mechanic_id"], name: "index_game_summary_mechanics_on_bgg_mechanic_id", using: :btree
  add_index "game_summary_mechanics", ["game_summary_id"], name: "index_game_summary_mechanics_on_game_summary_id", using: :btree

  create_table "game_summary_publishers", force: :cascade do |t|
    t.integer  "game_summary_id"
    t.integer  "bgg_publisher_id"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
  end

  add_index "game_summary_publishers", ["bgg_publisher_id"], name: "index_game_summary_publishers_on_bgg_publisher_id", using: :btree
  add_index "game_summary_publishers", ["game_summary_id"], name: "index_game_summary_publishers_on_game_summary_id", using: :btree

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

  create_table "session_attendances", force: :cascade do |t|
    t.uuid     "game_session"
    t.uuid     "player"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  add_index "session_attendances", ["game_session"], name: "index_session_attendances_on_game_session", using: :btree
  add_index "session_attendances", ["player"], name: "index_session_attendances_on_player", using: :btree

  create_table "versions", force: :cascade do |t|
    t.string   "item_type",  null: false
    t.integer  "item_id",    null: false
    t.string   "event",      null: false
    t.string   "whodunnit"
    t.text     "object"
    t.datetime "created_at"
  end

  add_index "versions", ["item_type", "item_id"], name: "index_versions_on_item_type_and_item_id", using: :btree

  add_foreign_key "game_library_items", "game_libraries"
  add_foreign_key "game_library_items", "game_summaries"
  add_foreign_key "game_summary_artists", "bgg_artists"
  add_foreign_key "game_summary_artists", "game_summaries"
  add_foreign_key "game_summary_categories", "bgg_categories"
  add_foreign_key "game_summary_categories", "game_summaries"
  add_foreign_key "game_summary_designers", "bgg_designers"
  add_foreign_key "game_summary_designers", "game_summaries"
  add_foreign_key "game_summary_families", "bgg_families"
  add_foreign_key "game_summary_families", "game_summaries"
  add_foreign_key "game_summary_mechanics", "bgg_mechanics"
  add_foreign_key "game_summary_mechanics", "game_summaries"
  add_foreign_key "game_summary_publishers", "bgg_publishers"
  add_foreign_key "game_summary_publishers", "game_summaries"
end
