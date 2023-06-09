# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.0].define(version: 2023_06_01_043107) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "academic_titles", force: :cascade do |t|
    t.bigint "graduate_id", null: false
    t.string "title"
    t.string "description"
    t.string "institucion"
    t.string "country"
    t.integer "year"
    t.string "title_type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["graduate_id"], name: "index_academic_titles_on_graduate_id"
  end

  create_table "admins", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.string "position"
    t.string "type_contract"
    t.integer "year_begin_contract"
    t.integer "salary_admin"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_admins_on_user_id"
  end

  create_table "graduates", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.integer "graduation_year"
    t.string "faculty"
    t.string "qualification"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_graduates_on_user_id"
  end

  create_table "life_histories", force: :cascade do |t|
    t.bigint "graduate_id", null: false
    t.string "title"
    t.string "description"
    t.string "date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["graduate_id"], name: "index_life_histories_on_graduate_id"
  end

  create_table "students", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.string "faculty"
    t.string "carerr"
    t.string "state"
    t.string "journey"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_students_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "lastname"
    t.string "email"
    t.integer "edad"
    t.string "photo"
    t.string "cc"
    t.string "direccion"
    t.string "celular"
    t.string "telefono"
    t.string "password_digest"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "type"
  end

  create_table "works", force: :cascade do |t|
    t.bigint "graduate_id", null: false
    t.string "carge"
    t.string "company"
    t.string "country"
    t.string "description"
    t.string "date_contract"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["graduate_id"], name: "index_works_on_graduate_id"
  end

  add_foreign_key "academic_titles", "graduates"
  add_foreign_key "admins", "users"
  add_foreign_key "graduates", "users"
  add_foreign_key "life_histories", "graduates"
  add_foreign_key "students", "users"
  add_foreign_key "works", "graduates"
end
