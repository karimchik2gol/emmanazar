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

ActiveRecord::Schema.define(version: 20170115175336) do

  create_table "apartments", force: :cascade do |t|
    t.integer  "num"
    t.integer  "project_id"
    t.string   "apartment_type"
    t.float    "general_square"
    t.float    "living_square"
    t.integer  "floor"
    t.integer  "room_count"
    t.float    "price"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  create_table "brokers", force: :cascade do |t|
    t.string   "name"
    t.string   "education"
    t.integer  "experience"
    t.integer  "experience_in_firm"
    t.float    "rating"
    t.float    "percent_for_service"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
  end

  create_table "clients", force: :cascade do |t|
    t.string   "name"
    t.string   "work_place"
    t.string   "position"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "order_yurists", force: :cascade do |t|
    t.integer  "project_id"
    t.integer  "apartment_id"
    t.integer  "yurist_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  create_table "orders", force: :cascade do |t|
    t.integer  "physical_id"
    t.integer  "broker_id"
    t.integer  "apartment_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  create_table "people", force: :cascade do |t|
    t.string   "name"
    t.string   "phone"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "physicals", force: :cascade do |t|
    t.string   "passport"
    t.string   "card_number"
    t.datetime "born_date"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.integer  "person_id"
  end

  create_table "projects", force: :cascade do |t|
    t.string   "name"
    t.integer  "zabydovnuk_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  create_table "yurists", force: :cascade do |t|
    t.string   "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "person_id"
  end

  create_table "zabydovnuks", force: :cascade do |t|
    t.string   "name"
    t.integer  "years_on_market", default: 0
    t.integer  "projects_count",  default: 0
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
  end

end
