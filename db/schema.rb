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

ActiveRecord::Schema.define(version: 20170815134410) do

  create_table "reservations", force: :cascade do |t|
    t.string   "name"
    t.text     "description"
    t.boolean  "released",    default: false
    t.datetime "start_time"
    t.integer  "testline_id"
    t.integer  "team_id"
    t.integer  "user_id"
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
  end

  add_index "reservations", ["team_id"], name: "index_reservations_on_team_id"
  add_index "reservations", ["testline_id"], name: "index_reservations_on_testline_id"
  add_index "reservations", ["user_id"], name: "index_reservations_on_user_id"

  create_table "team_testlines", force: :cascade do |t|
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.integer  "team_id"
    t.integer  "testline_id"
  end

  add_index "team_testlines", ["team_id"], name: "index_team_testlines_on_team_id"
  add_index "team_testlines", ["testline_id"], name: "index_team_testlines_on_testline_id"

  create_table "teams", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "testlines", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at",                    null: false
    t.datetime "updated_at",                    null: false
    t.string   "ip_address"
    t.integer  "port_number"
    t.boolean  "isMaintenance", default: false
    t.text     "description"
    t.string   "diagram"
  end

  create_table "users", force: :cascade do |t|
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
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.boolean  "isAdmin"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

end
