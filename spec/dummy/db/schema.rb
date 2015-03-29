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

ActiveRecord::Schema.define(version: 20150328224244) do

  create_table "reporting_fields", force: :cascade do |t|
    t.integer  "report_id",       null: false
    t.integer  "filter_group_id", null: false
    t.integer  "filter_type_id",  null: false
    t.integer  "lookup_table_id"
    t.string   "name",            null: false
    t.string   "title"
    t.boolean  "is_filterable"
    t.boolean  "is_output"
    t.boolean  "is_validate"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  add_index "reporting_fields", ["filter_group_id"], name: "index_reporting_fields_on_filter_group_id"
  add_index "reporting_fields", ["filter_type_id"], name: "index_reporting_fields_on_filter_type_id"
  add_index "reporting_fields", ["lookup_table_id"], name: "index_reporting_fields_on_lookup_table_id"
  add_index "reporting_fields", ["report_id"], name: "index_reporting_fields_on_report_id"

  create_table "reporting_filter_groups", force: :cascade do |t|
    t.string   "name",       null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "reporting_filter_types", force: :cascade do |t|
    t.string   "name",       null: false
    t.string   "partial"
    t.string   "formatter"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "reporting_lookup_tables", force: :cascade do |t|
    t.string   "name",               null: false
    t.string   "display_field_name", null: false
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
  end

  create_table "reporting_reports", force: :cascade do |t|
    t.string   "name",        null: false
    t.string   "description"
    t.string   "data_source", null: false
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

end