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

ActiveRecord::Schema.define(version: 20150511224303) do

  create_table "reporting_filter_fields", force: :cascade do |t|
    t.integer  "report_id",                   null: false
    t.integer  "filter_group_id",             null: false
    t.integer  "filter_type_id",              null: false
    t.integer  "lookup_table_id"
    t.string   "name",                        null: false
    t.string   "title"
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
    t.integer  "sort_order",      default: 1, null: false
    t.string   "value_type"
  end

  add_index "reporting_filter_fields", ["filter_group_id"], name: "index_reporting_filter_fields_on_filter_group_id"
  add_index "reporting_filter_fields", ["filter_type_id"], name: "index_reporting_filter_fields_on_filter_type_id"
  add_index "reporting_filter_fields", ["lookup_table_id"], name: "index_reporting_filter_fields_on_lookup_table_id"
  add_index "reporting_filter_fields", ["report_id"], name: "index_reporting_filter_fields_on_report_id"

  create_table "reporting_filter_groups", force: :cascade do |t|
    t.string   "name",       null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "reporting_filter_types", force: :cascade do |t|
    t.string   "name",       null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "reporting_lookup_tables", force: :cascade do |t|
    t.string   "name",                              null: false
    t.string   "display_field_name",                null: false
    t.datetime "created_at",                        null: false
    t.datetime "updated_at",                        null: false
    t.string   "id_field_name",      default: "id", null: false
  end

  create_table "reporting_output_fields", force: :cascade do |t|
    t.string   "name",              null: false
    t.string   "title"
    t.integer  "report_id",         null: false
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
    t.string   "formatter"
    t.integer  "numeric_precision"
  end

  add_index "reporting_output_fields", ["report_id"], name: "index_reporting_output_fields_on_report_id"

  create_table "reporting_reports", force: :cascade do |t|
    t.string   "name",                       null: false
    t.string   "description"
    t.string   "data_source",                null: false
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
    t.string   "primary_key", default: "id", null: false
  end

  create_table "reporting_specific_filter_groups", force: :cascade do |t|
    t.integer  "sort_order",      default: 1, null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "report_id"
    t.integer  "filter_group_id"
  end

  add_index "reporting_specific_filter_groups", ["filter_group_id"], name: "index_reporting_specific_filter_groups_on_filter_group_id"
  add_index "reporting_specific_filter_groups", ["report_id"], name: "index_reporting_specific_filter_groups_on_report_id"

end
