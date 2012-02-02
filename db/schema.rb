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

ActiveRecord::Schema.define(:version => 20120202123020) do

  create_table "contents", :force => true do |t|
    t.integer  "user_id"
    t.integer  "text_id"
    t.integer  "image_id"
    t.boolean  "submittedby"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  add_index "contents", ["image_id"], :name => "index_contents_on_image_id"
  add_index "contents", ["text_id"], :name => "index_contents_on_text_id"
  add_index "contents", ["user_id"], :name => "index_contents_on_user_id"

  create_table "images", :force => true do |t|
    t.string   "title"
    t.string   "abstract"
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.string   "image_file_size"
    t.boolean  "publish"
    t.boolean  "firstpage"
    t.integer  "license_id"
    t.datetime "created_at",         :null => false
    t.datetime "updated_at",         :null => false
  end

  add_index "images", ["license_id"], :name => "index_images_on_license_id"

  create_table "licenses", :force => true do |t|
    t.string   "name"
    t.string   "description"
    t.string   "url"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "texts", :force => true do |t|
    t.string   "title"
    t.string   "abstract"
    t.text     "body"
    t.boolean  "publish"
    t.boolean  "firstpage"
    t.integer  "license_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "texts", ["license_id"], :name => "index_texts_on_license_id"

  create_table "users", :force => true do |t|
    t.string   "firstname"
    t.string   "lastname"
    t.string   "email"
    t.string   "password"
    t.boolean  "status"
    t.datetime "created_at",                             :null => false
    t.datetime "updated_at",                             :null => false
    t.string   "encrypted_password",     :default => "", :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

end
