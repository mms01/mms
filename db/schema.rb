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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20140811050712) do

  create_table "meetings", :force => true do |t|
    t.string   "title"
    t.text     "purpose"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
    t.string   "create_user_id"
    t.string   "place"
    t.datetime "update_date"
    t.boolean  "available"
    t.date     "meeting_date"
    t.time     "start_time"
    t.time     "end_time"
    t.string   "status"
    t.integer  "project_id"
    t.string   "update_user_id"
    t.integer  "user_id"
  end

  create_table "minutes", :force => true do |t|
    t.string   "meeting_id"
    t.string   "detail"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "project_users", :force => true do |t|
    t.integer  "project_id"
    t.integer  "user_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "project_users", ["project_id", "user_id"], :name => "index_project_users_on_project_id_and_user_id", :unique => true

  create_table "projects", :force => true do |t|
    t.string   "name"
    t.datetime "created_at",                        :null => false
    t.datetime "updated_at",                        :null => false
    t.string   "manager_id"
    t.string   "create_user_id"
    t.date     "start_date"
    t.date     "end_date"
    t.text     "purpose"
    t.string   "sts"
    t.binary   "attached"
    t.boolean  "delete_flag",    :default => false
  end

  create_table "todos", :force => true do |t|
    t.string   "meeting_id"
    t.string   "summary"
    t.string   "detail"
    t.integer  "owner"
    t.date     "enddate"
    t.string   "sts"
    t.string   "biko"
    t.integer  "createdby"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "users", :force => true do |t|
    t.string   "email",                  :default => "",   :null => false
    t.string   "encrypted_password",     :default => "",   :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          :default => 0,    :null => false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                               :null => false
    t.datetime "updated_at",                               :null => false
    t.string   "role"
    t.string   "user_name"
    t.boolean  "available",              :default => true
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

end
