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

ActiveRecord::Schema.define(version: 20161114002825) do

  create_table "referees", force: :cascade do |t|
    t.text     "username"
    t.string   "password_digest"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.integer  "level"
    t.index ["username"], name: "index_referees_on_username", unique: true
  end

  create_table "schedules", force: :cascade do |t|
    t.integer  "team1_id"
    t.integer  "team2_id"
    t.datetime "date"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
    t.integer  "team1_score"
    t.integer  "team2_score"
    t.integer  "previously_scored"
    t.integer  "team1_style"
    t.integer  "team2_style"
    t.integer  "team1_presentation"
    t.integer  "team2_presentation"
    t.integer  "team1_understanding"
    t.integer  "team2_understanding"
    t.integer  "team1_response"
    t.integer  "team2_response"
  end

  create_table "teams", force: :cascade do |t|
    t.text     "name",       limit: 32, null: false
    t.text     "captain",    limit: 32
    t.integer  "score"
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
    t.index ["name"], name: "index_teams_on_name", unique: true
  end

end
