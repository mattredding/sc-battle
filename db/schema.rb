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

ActiveRecord::Schema.define(:version => 20110821144823) do

  create_table "battles", :force => true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "battles_users", :id => false, :force => true do |t|
    t.integer "battle_id"
    t.integer "sc_user_id"
  end

  create_table "tracks", :force => true do |t|
    t.integer  "soundcloud_track_id"
    t.string   "title"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "battle_id"
    t.string   "permalink"
    t.string   "permalink_url"
  end

  create_table "users", :force => true do |t|
    t.integer  "soundcloud_uid"
    t.string   "soundcloud_username"
    t.string   "soundcloud_access_token"
    t.string   "soundcloud_expires_at"
    t.string   "soundcloud_refresh_token"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "votes", :force => true do |t|
    t.integer  "soundcloud_track_id"
    t.integer  "user_id"
    t.integer  "battle_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "track_id"
  end

end
