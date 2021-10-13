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

ActiveRecord::Schema.define(version: 2021_10_12_212013) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "composers", force: :cascade do |t|
    t.string "name"
    t.string "nationality"
    t.boolean "active"
    t.integer "total_songs"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "musicians", force: :cascade do |t|
    t.integer "orchestra_id"
    t.string "name"
    t.boolean "hirable"
    t.integer "age"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "orchestras", force: :cascade do |t|
    t.string "name"
    t.string "city"
    t.boolean "hiring"
    t.integer "max_musicians"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "songs", force: :cascade do |t|
    t.integer "composer_id"
    t.string "name"
    t.boolean "public_domain"
    t.integer "year_composed"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
