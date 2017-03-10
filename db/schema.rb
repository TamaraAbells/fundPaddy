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

ActiveRecord::Schema.define(version: 20170310190710) do

  create_table "accounts", force: :cascade do |t|
    t.integer  "member_id"
    t.string   "bank_name"
    t.string   "acc_no"
    t.string   "acc_name"
    t.string   "bitcoin_address"
    t.string   "phone"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.index ["member_id"], name: "index_accounts_on_member_id"
  end

  create_table "donations", force: :cascade do |t|
    t.integer  "amount"
    t.string   "plan"
    t.integer  "member_id"
    t.text     "comment"
    t.datetime "created_at",                       null: false
    t.datetime "updated_at",                       null: false
    t.string   "status",       default: "waiting"
    t.integer  "recipient_id"
    t.string   "pay_status"
    t.string   "payment_text"
    t.string   "pop"
    t.index ["member_id", "plan"], name: "index_donations_on_member_id_and_plan"
    t.index ["member_id"], name: "index_donations_on_member_id"
  end

  create_table "members", force: :cascade do |t|
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
    t.string   "firstname"
    t.string   "lastname"
    t.string   "fullname"
    t.string   "referrer"
    t.index ["email"], name: "index_members_on_email", unique: true
    t.index ["reset_password_token"], name: "index_members_on_reset_password_token", unique: true
  end

  create_table "messages", force: :cascade do |t|
    t.text     "content"
    t.string   "title"
    t.integer  "status"
    t.integer  "recipient_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.string   "email"
  end

  create_table "notifications", force: :cascade do |t|
    t.integer  "member_id"
    t.text     "message"
    t.string   "title"
    t.integer  "status"
    t.integer  "recipient_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.index ["member_id"], name: "index_notifications_on_member_id"
  end

  create_table "withdrawals", force: :cascade do |t|
    t.string   "plan"
    t.integer  "amount"
    t.string   "status"
    t.integer  "member_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.integer  "donation_id"
    t.index ["member_id", "status"], name: "index_withdrawals_on_member_id_and_status"
    t.index ["member_id"], name: "index_withdrawals_on_member_id"
  end

end
