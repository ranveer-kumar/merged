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

ActiveRecord::Schema.define(version: 20150517062021) do

  create_table "coursefeedbacks", force: :cascade do |t|
    t.integer  "course_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "coursephotos", force: :cascade do |t|
    t.integer  "course_id"
    t.text     "photourl"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "courseprivacies", force: :cascade do |t|
    t.boolean  "private"
    t.boolean  "public"
    t.integer  "course_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "courses", force: :cascade do |t|
    t.integer  "instructor_id"
    t.text     "title"
    t.text     "subtitle"
    t.text     "objectives"
    t.integer  "language_id"
    t.integer  "category_id"
    t.integer  "subcategory_id"
    t.integer  "level_id"
    t.boolean  "certificate"
    t.text     "lectures"
    t.text     "coursecontentjson"
    t.integer  "privacy_level"
    t.integer  "priceandcoupon_id"
    t.text     "instructoridlist"
    t.text     "questionslist"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
    t.text     "coursephoto"
  end

  create_table "lessons", force: :cascade do |t|
    t.text     "title"
    t.integer  "course_id"
    t.text     "description"
    t.integer  "level_id"
    t.text     "contenturl"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "manageinstructors", force: :cascade do |t|
    t.integer  "course_id"
    t.integer  "instructor_id"
    t.boolean  "visible"
    t.boolean  "edit"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  create_table "priceandcoupons", force: :cascade do |t|
    t.integer  "course_id"
    t.boolean  "free"
    t.boolean  "paid"
    t.decimal  "priceforindia"
    t.boolean  "discount"
    t.decimal  "discountpercent"
    t.date     "periodfrom"
    t.date     "periodto"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  create_table "questions", force: :cascade do |t|
    t.text     "question_text"
    t.text     "question_desc"
    t.integer  "course_id"
    t.text     "subtitle"
    t.integer  "question_type_id"
    t.integer  "question_grade"
    t.boolean  "randomise"
    t.text     "question_media"
    t.text     "answer_feedback"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "provider"
    t.string   "uid"
    t.decimal  "mobile"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

end
