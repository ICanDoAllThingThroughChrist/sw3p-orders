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

ActiveRecord::Schema.define(version: 20180213171105) do

  create_table "comments", force: :cascade do |t|
    t.string "comment"
    t.integer "order_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "name"
  end

  create_table "comments_orders", id: false, force: :cascade do |t|
    t.integer "order_id"
    t.integer "comment_id"
  end

  create_table "deadlines", force: :cascade do |t|
    t.string "deadline"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "order_id"
  end

  create_table "frequencies", force: :cascade do |t|
    t.string "frequency"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "order_id"
  end

  create_table "order_deadlines", force: :cascade do |t|
    t.integer "order_id"
    t.integer "deadline_id"
  end

  create_table "order_frequencies", force: :cascade do |t|
    t.integer "order_id"
    t.integer "frequencie_id"
  end

  create_table "order_statuses", force: :cascade do |t|
    t.integer "order_id"
    t.integer "statuse_id"
  end

  create_table "order_tasks", force: :cascade do |t|
    t.integer "order_id"
    t.integer "task_id"
  end

  create_table "ordercomments", force: :cascade do |t|
    t.integer "order_id"
    t.integer "comment_id"
  end

  create_table "orders", force: :cascade do |t|
    t.integer "site_id"
    t.integer "task_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "user_id"
    t.string "site"
    t.string "task"
    t.string "deadline"
    t.string "frequency"
    t.datetime "firstupdate"
    t.string "firstupdatecomment"
    t.integer "comment_id"
    t.integer "status_id"
    t.integer "deadline_id"
    t.integer "frequencie_id"
    t.string "status"
  end

  create_table "sites", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "sitetasks", force: :cascade do |t|
    t.integer "site_id"
    t.integer "task_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "quantity", default: 1
    t.integer "user_id"
  end

  create_table "statuses", force: :cascade do |t|
    t.string "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "order_id"
  end

  create_table "tasks", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "price"
    t.integer "inventory"
    t.integer "user_id"
    t.boolean "task_status"
    t.integer "order_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "email"
    t.string "password_digest"
    t.string "password_confirmation"
    t.boolean "admin", default: false
    t.string "uid"
    t.string "image"
    t.index ["email"], name: "index_users_on_email", unique: true
  end

  create_table "workorders", force: :cascade do |t|
    t.integer "task_id"
    t.integer "frequency_id"
    t.integer "deadline_id"
    t.integer "status_id"
    t.integer "site_id"
    t.integer "user_id"
  end

end
