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

ActiveRecord::Schema.define(version: 20160701052201) do

  create_table "exp_blti_keys", force: :cascade do |t|
    t.string   "oauth_consumer_key", limit: 255, null: false
    t.string   "secret",             limit: 255
    t.string   "name",               limit: 255
    t.string   "context_id",         limit: 255
    t.string   "url_segment",        limit: 255
    t.string   "linkgen_id",         limit: 255
    t.string   "session_key",        limit: 8
    t.boolean  "used",               default: false
    t.datetime "created_at",                     null: false
    t.datetime "updated_at",                     null: false
  end

  add_index "exp_blti_keys", ["url_segment"], name: "url_segment", unique: true, using: :btree

  create_table "exp_lti_course_contexts", force: :cascade do |t|
    t.integer "institution_id", limit: 4,   null: false
    t.string  "context_id",     limit: 255, null: false
  end

  create_table "exp_lti_course_link_resources", force: :cascade do |t|
    t.integer "course_id",                          limit: 3,                  null: false
    t.string  "resource_link_id",                   limit: 255,                null: false
    t.string  "rubric_id",                          limit: 18,                 null: false
    t.boolean "peer_assessment_show_column_scores",             default: true
  end

  add_index "exp_lti_course_link_resources", ["resource_link_id"], name: "resource_link_id", using: :btree
  add_index "exp_lti_course_link_resources", ["resource_link_id"], name: "resource_link_id_2", length: {"resource_link_id"=>10}, using: :btree

  create_table "exp_lti_instructor_settings", id: false, force: :cascade do |t|
    t.string   "problem_prefix",             limit: 20,                         null: false
    t.string   "solution_prefix",            limit: 20,                         null: false
    t.boolean  "enable_group_import",                                           null: false
    t.string   "plugins_active",             limit: 500
    t.string   "course_key",                 limit: 255,                        null: false
    t.integer  "institution_id",             limit: 3,                          null: false
    t.text     "gradebook",                  limit: 4294967295
    t.datetime "last_update",                                                   null: false
    t.boolean  "show_grade_column",                             default: true
    t.boolean  "show_comments",                                 default: true
    t.boolean  "allow_self_assessment",                         default: false
    t.boolean  "include_self_in_mean_score",                    default: false
    t.string   "user_access",                limit: 5000
    t.integer  "total_score",                limit: 1,                          null: false
    t.datetime "created_at",                                                    null: false
    t.datetime "updated_at",                                                    null: false
  end

  create_table "exp_template_groups", primary_key: "group_id", force: :cascade do |t|
    t.integer "site_id",         limit: 4,  default: 1,   null: false
    t.string  "group_name",      limit: 50,               null: false
    t.integer "group_order",     limit: 4,                null: false
    t.string  "is_site_default", limit: 1,  default: "n", null: false
  end

  add_index "exp_template_groups", ["group_name"], name: "group_name_idx", using: :btree
  add_index "exp_template_groups", ["group_order"], name: "group_order_idx", using: :btree
  add_index "exp_template_groups", ["site_id"], name: "site_id", using: :btree

  create_table "exp_templates", primary_key: "template_id", force: :cascade do |t|
    t.integer "site_id",            limit: 4,        default: 1,         null: false
    t.integer "group_id",           limit: 4,                            null: false
    t.string  "template_name",      limit: 50,                           null: false
    t.string  "template_type",      limit: 16,       default: "webpage", null: false
    t.text    "template_data",      limit: 16777215
    t.text    "template_notes",     limit: 65535
    t.integer "edit_date",          limit: 4,        default: 0,         null: false
    t.integer "last_author_id",     limit: 4,        default: 0,         null: false
    t.string  "cache",              limit: 1,        default: "n",       null: false
    t.integer "refresh",            limit: 4,        default: 0,         null: false
    t.string  "no_auth_bounce",     limit: 50,       default: "",        null: false
    t.string  "enable_http_auth",   limit: 1,        default: "n",       null: false
    t.string  "allow_php",          limit: 1,        default: "n",       null: false
    t.string  "php_parse_location", limit: 1,        default: "o",       null: false
    t.integer "hits",               limit: 4,        default: 0,         null: false
    t.string  "protect_javascript", limit: 1,        default: "n",       null: false
    t.datetime "created_at",                                             null: false
    t.datetime "updated_at",                                             null: false
  end

  add_index "exp_templates", ["group_id"], name: "group_id", using: :btree
  add_index "exp_templates", ["site_id"], name: "site_id", using: :btree
  add_index "exp_templates", ["template_name"], name: "template_name", using: :btree

end