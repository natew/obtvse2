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

ActiveRecord::Schema.define(version: 20130809232825) do

  create_table "obtvse_authentications", force: true do |t|
    t.integer  "obtvse_user_id",  null: false
    t.string   "obtvse_provider", null: false
    t.string   "uid",             null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "obtvse_images", force: true do |t|
    t.string   "image_file_name"
    t.string   "image_file_size"
    t.string   "image_content_type"
    t.datetime "image_updated_at"
  end

  create_table "obtvse_posts", force: true do |t|
    t.string   "title"
    t.string   "slug"
    t.text     "content"
    t.boolean  "draft",        default: true
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "aside",        default: false
    t.string   "url"
    t.integer  "parent"
    t.integer  "timespent"
    t.datetime "published_at"
  end

  create_table "obtvse_revisions", force: true do |t|
    t.integer  "version"
    t.text     "content"
    t.integer  "post_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "title"
  end

  create_table "obtvse_users", force: true do |t|
    t.string   "username",                                    null: false
    t.string   "email"
    t.string   "crypted_password"
    t.string   "salt"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "remember_me_token"
    t.datetime "remember_me_token_expires_at"
    t.string   "reset_password_token"
    t.datetime "reset_password_token_expires_at"
    t.datetime "reset_password_email_sent_at"
    t.datetime "last_login_at"
    t.datetime "last_logout_at"
    t.datetime "last_activity_at"
    t.integer  "failed_logins_count",             default: 0
    t.datetime "lock_expires_at"
    t.string   "last_login_from_ip_address"
  end

  add_index "obtvse_users", ["last_logout_at", "last_activity_at"], name: "index_obtvse_users_on_last_logout_at_and_last_activity_at"
  add_index "obtvse_users", ["remember_me_token"], name: "index_obtvse_users_on_remember_me_token"
  add_index "obtvse_users", ["reset_password_token"], name: "index_obtvse_users_on_reset_password_token"

end
