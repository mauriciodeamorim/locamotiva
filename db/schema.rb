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

ActiveRecord::Schema.define(:version => 20110907043852) do

  create_table "athletes", :force => true do |t|
    t.string   "name"
    t.string   "sex"
    t.date     "birthday"
    t.string   "cpf"
    t.string   "phone"
    t.string   "nick"
    t.string   "email"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "races", :force => true do |t|
    t.string   "name"
    t.string   "stage"
    t.datetime "date"
    t.string   "place"
    t.string   "distance"
    t.string   "url"
    t.boolean  "showme"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "results", :force => true do |t|
    t.string   "search_name"
    t.string   "start_number"
    t.string   "category"
    t.string   "team"
    t.datetime "liquid_time"
    t.datetime "official_time"
    t.integer  "class_general"
    t.integer  "class_sex"
    t.integer  "class_category"
    t.datetime "pace"
    t.string   "distance"
    t.string   "substitute"
    t.text     "notes"
    t.string   "tshirt"
    t.integer  "race_id"
    t.integer  "user_id"
    t.integer  "athlete_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", :force => true do |t|
    t.string   "email",                               :default => "", :null => false
    t.string   "encrypted_password",   :limit => 128, :default => "", :null => false
    t.string   "reset_password_token"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",                       :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "username"
    t.string   "name"
    t.string   "sex"
    t.date     "birthday"
    t.string   "cpf"
    t.string   "rg"
    t.string   "teamcode"
    t.string   "mobile"
    t.boolean  "former_official"
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

end
