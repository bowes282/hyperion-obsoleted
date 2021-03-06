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

ActiveRecord::Schema.define(:version => 20120531053329) do

  create_table "host_roles", :force => true do |t|
    t.integer  "host_id"
    t.integer  "role_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "host_roles", ["host_id"], :name => "index_host_roles_on_host_id"
  add_index "host_roles", ["role_id", "host_id"], :name => "index_host_roles_on_role_id_and_host_id", :unique => true
  add_index "host_roles", ["role_id"], :name => "index_host_roles_on_role_id"

  create_table "host_services", :force => true do |t|
    t.integer  "host_id"
    t.integer  "service_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "host_services", ["host_id"], :name => "index_host_services_on_host_id"
  add_index "host_services", ["service_id", "host_id"], :name => "index_host_services_on_service_id_and_host_id", :unique => true
  add_index "host_services", ["service_id"], :name => "index_host_services_on_service_id"

  create_table "hosts", :force => true do |t|
    t.string   "ip_address"
    t.string   "hostname"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "hosts", ["hostname"], :name => "index_hosts_on_hostname", :unique => true
  add_index "hosts", ["ip_address"], :name => "index_hosts_on_ip_address", :unique => true

  create_table "roles", :force => true do |t|
    t.string   "name"
    t.text     "description"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "services", :force => true do |t|
    t.string   "name"
    t.text     "description"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  add_index "services", ["name"], :name => "index_services_on_name", :unique => true

  create_table "users", :force => true do |t|
    t.string   "provider"
    t.integer  "uid"
    t.string   "name"
    t.string   "image"
    t.string   "token"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "users", ["name"], :name => "index_users_on_name", :unique => true
  add_index "users", ["provider", "uid"], :name => "index_users_on_provider_and_uid", :unique => true
  add_index "users", ["token"], :name => "index_users_on_token", :unique => true

end
