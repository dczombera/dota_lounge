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

ActiveRecord::Schema.define(version: 20150827154326) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"
  enable_extension "hstore"

  create_table "abilities", force: :cascade do |t|
    t.integer  "steam_id",       null: false
    t.integer  "hero_id",        null: false
    t.string   "name",           null: false
    t.string   "localized_name"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  add_index "abilities", ["steam_id"], name: "index_abilities_on_steam_id", unique: true, using: :btree

  create_table "heroes", force: :cascade do |t|
    t.string   "name",           null: false
    t.integer  "steam_id",       null: false
    t.string   "localized_name"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  add_index "heroes", ["steam_id"], name: "index_heroes_on_steam_id", unique: true, using: :btree

  create_table "items", force: :cascade do |t|
    t.integer  "steam_id",                       null: false
    t.string   "name",                           null: false
    t.string   "localized_name"
    t.integer  "cost",                           null: false
    t.boolean  "secret_shop",    default: false, null: false
    t.boolean  "side_shop",      default: false, null: false
    t.boolean  "recipe",         default: false, null: false
    t.datetime "created_at",                     null: false
    t.datetime "updated_at",                     null: false
  end

  add_index "items", ["steam_id"], name: "index_items_on_steam_id", unique: true, using: :btree

  create_table "leagues", force: :cascade do |t|
    t.string   "name",           null: false
    t.integer  "leagueid",       null: false
    t.string   "description",    null: false
    t.string   "tournament_url", null: false
    t.integer  "itemdef"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  add_index "leagues", ["leagueid"], name: "index_leagues_on_leagueid", using: :btree

  create_table "live_league_matches", force: :cascade do |t|
    t.hstore   "players",                       null: false, array: true
    t.hstore   "radiant_team",                  null: false
    t.hstore   "dire_team",                     null: false
    t.integer  "lobby_id",            limit: 8, null: false
    t.integer  "match_id",                      null: false
    t.integer  "spectators"
    t.integer  "league_id",                     null: false
    t.integer  "stream_delay_s"
    t.integer  "radiant_series_wins"
    t.integer  "dire_series_wins"
    t.integer  "series_type"
    t.integer  "league_series_id"
    t.integer  "league_game_id"
    t.integer  "league_tier"
    t.hstore   "scoreboard",                    null: false
    t.datetime "created_at",                    null: false
    t.datetime "updated_at",                    null: false
  end

  add_index "live_league_matches", ["match_id"], name: "index_live_league_matches_on_match_id", unique: true, using: :btree

  create_table "matches", force: :cascade do |t|
    t.integer  "match_id",                                          null: false
    t.integer  "match_seq_num",                                     null: false
    t.datetime "start_time",                                        null: false
    t.integer  "duration",                                          null: false
    t.boolean  "radiant_win",                       default: false, null: false
    t.integer  "tower_status_radiant",                              null: false
    t.integer  "tower_status_dire",                                 null: false
    t.integer  "barracks_status_radiant",                           null: false
    t.integer  "barracks_status_dire",                              null: false
    t.integer  "cluster",                                           null: false
    t.integer  "first_blood_time",                                  null: false
    t.integer  "lobby_type",                                        null: false
    t.integer  "human_players",                                     null: false
    t.integer  "leagueid",                                          null: false
    t.integer  "positive_votes",                                    null: false
    t.integer  "negative_votes",                                    null: false
    t.integer  "game_mode",                                         null: false
    t.integer  "engine"
    t.integer  "radiant_team_id"
    t.string   "radiant_name"
    t.integer  "radiant_logo",            limit: 8
    t.boolean  "radiant_team_complete"
    t.integer  "dire_team_id"
    t.string   "dire_name"
    t.integer  "dire_logo",               limit: 8
    t.boolean  "dire_team_complete"
    t.integer  "radiant_captain"
    t.integer  "dire_captain"
    t.jsonb    "picks_bans"
    t.jsonb    "players",                                           null: false
    t.datetime "created_at",                                        null: false
    t.datetime "updated_at",                                        null: false
  end

  add_index "matches", ["dire_team_id"], name: "index_matches_on_dire_team_id", using: :btree
  add_index "matches", ["game_mode"], name: "index_matches_on_game_mode", using: :btree
  add_index "matches", ["leagueid"], name: "index_matches_on_leagueid", using: :btree
  add_index "matches", ["lobby_type"], name: "index_matches_on_lobby_type", using: :btree
  add_index "matches", ["match_id"], name: "index_matches_on_match_id", unique: true, using: :btree
  add_index "matches", ["players"], name: "index_matches_on_players", using: :gin
  add_index "matches", ["radiant_team_id"], name: "index_matches_on_radiant_team_id", using: :btree

end
