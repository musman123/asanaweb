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

ActiveRecord::Schema.define(version: 20200325034650) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "comments", force: :cascade do |t|
    t.string   "commenter"
    t.text     "body"
    t.integer  "task_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "comments", ["task_id"], name: "index_comments_on_task_id", using: :btree

  create_table "pictures", force: :cascade do |t|
    t.string   "name"
    t.integer  "pictureable_id"
    t.string   "pictureable_type"
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
    t.string   "photo_file_name"
    t.string   "photo_content_type"
    t.integer  "photo_file_size",    limit: 8
    t.datetime "photo_updated_at"
  end

  add_index "pictures", ["pictureable_type", "pictureable_id"], name: "index_pictures_on_pictureable_type_and_pictureable_id", using: :btree

  create_table "projects", force: :cascade do |t|
    t.string   "title"
    t.text     "description"
    t.string   "department"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "projects_tasks", id: false, force: :cascade do |t|
    t.integer "project_id", null: false
    t.integer "task_id",    null: false
  end

  add_index "projects_tasks", ["project_id", "task_id"], name: "index_projects_tasks_on_project_id_and_task_id", using: :btree
  add_index "projects_tasks", ["task_id", "project_id"], name: "index_projects_tasks_on_task_id_and_project_id", using: :btree

  create_table "tasks", force: :cascade do |t|
    t.string   "name"
    t.text     "task_description"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.string   "assigner"
    t.string   "assign_to"
    t.date     "start_date"
    t.date     "submission_date"
    t.integer  "user_id"
    t.string   "project_name"
    t.string   "comments"
    t.string   "opinion"
    t.string   "all_project"
    t.string   "all_comments"
  end

  add_index "tasks", ["user_id"], name: "index_tasks_on_user_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "name"
    t.string   "email"
    t.string   "password"
    t.string   "password_conformation"
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
    t.string   "password_digest"
  end

  add_foreign_key "comments", "tasks"
  add_foreign_key "tasks", "users"
end
