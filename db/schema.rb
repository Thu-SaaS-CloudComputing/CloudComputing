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

ActiveRecord::Schema.define(:version => 20131123125328) do

  create_table "articles", :force => true do |t|
    t.string   "title"
    t.string   "author"
    t.integer  "category_id"
    t.text     "content",     :default => "(No Content)"
    t.datetime "created_at",                              :null => false
    t.datetime "updated_at",                              :null => false
    t.text     "tags"
  end

  add_index "articles", ["category_id"], :name => "index_articles_on_category_id"

  create_table "categories", :force => true do |t|
    t.string   "name"
    t.text     "description"
    t.text     "option"
    t.integer  "parent",        :default => 0
    t.integer  "order"
    t.datetime "created_at",                   :null => false
    t.datetime "updated_at",                   :null => false
    t.string   "show_on_index"
  end

  create_table "lessons", :force => true do |t|
    t.string  "name"
    t.integer "column"
    t.integer "row"
    t.string  "classroom"
    t.string  "department"
  end

  create_table "roots", :force => true do |t|
    t.string   "username"
    t.string   "password"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

end
