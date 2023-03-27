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

ActiveRecord::Schema.define(version: 2023_03_27_191825) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "careers", force: :cascade do |t|
    t.string "name"
    t.string "abbreviation"
    t.string "level"
    t.string "step"
    t.integer "quantity"
    t.float "anual_impact"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "contracts", force: :cascade do |t|
    t.bigint "job_id", null: false
    t.bigint "employee_id", null: false
    t.bigint "hospital_id", null: false
    t.date "start_date"
    t.date "estimate_finish_date"
    t.date "finish_date"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["employee_id"], name: "index_contracts_on_employee_id"
    t.index ["hospital_id"], name: "index_contracts_on_hospital_id"
    t.index ["job_id"], name: "index_contracts_on_job_id"
  end

  create_table "employees", force: :cascade do |t|
    t.string "cpf"
    t.string "masp"
    t.integer "admission"
    t.string "name"
    t.bigint "career_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["career_id"], name: "index_employees_on_career_id"
    t.index ["cpf", "masp", "admission"], name: "index_employees_on_cpf_and_masp_and_admission", unique: true
  end

  create_table "hospitals", force: :cascade do |t|
    t.string "name"
    t.string "abbreviation"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "jobs", force: :cascade do |t|
    t.bigint "career_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "status", default: 1
    t.index ["career_id"], name: "index_jobs_on_career_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "profile"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "contracts", "employees"
  add_foreign_key "contracts", "hospitals"
  add_foreign_key "contracts", "jobs"
  add_foreign_key "employees", "careers"
  add_foreign_key "jobs", "careers"
end
