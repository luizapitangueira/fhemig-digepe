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

ActiveRecord::Schema.define(version: 2023_05_15_191154) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "ahoy_events", force: :cascade do |t|
    t.bigint "visit_id"
    t.bigint "user_id"
    t.string "name"
    t.jsonb "properties"
    t.datetime "time"
    t.index ["name", "time"], name: "index_ahoy_events_on_name_and_time"
    t.index ["properties"], name: "index_ahoy_events_on_properties", opclass: :jsonb_path_ops, using: :gin
    t.index ["user_id"], name: "index_ahoy_events_on_user_id"
    t.index ["visit_id"], name: "index_ahoy_events_on_visit_id"
  end

  create_table "ahoy_visits", force: :cascade do |t|
    t.string "visit_token"
    t.string "visitor_token"
    t.bigint "user_id"
    t.string "ip"
    t.text "user_agent"
    t.text "referrer"
    t.string "referring_domain"
    t.text "landing_page"
    t.string "browser"
    t.string "os"
    t.string "device_type"
    t.string "country"
    t.string "region"
    t.string "city"
    t.float "latitude"
    t.float "longitude"
    t.string "utm_source"
    t.string "utm_medium"
    t.string "utm_term"
    t.string "utm_content"
    t.string "utm_campaign"
    t.string "app_version"
    t.string "os_version"
    t.string "platform"
    t.datetime "started_at"
    t.index ["user_id"], name: "index_ahoy_visits_on_user_id"
    t.index ["visit_token"], name: "index_ahoy_visits_on_visit_token", unique: true
  end

  create_table "careers", force: :cascade do |t|
    t.string "name"
    t.string "abbreviation"
    t.string "level"
    t.string "step"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "category"
    t.integer "workload"
  end

  create_table "contract_effectives", force: :cascade do |t|
    t.bigint "job_effective_id", null: false
    t.bigint "employee_id", null: false
    t.bigint "hospital_id", null: false
    t.string "setor"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "if_office"
    t.index ["employee_id"], name: "index_contract_effectives_on_employee_id"
    t.index ["hospital_id"], name: "index_contract_effectives_on_hospital_id"
    t.index ["job_effective_id"], name: "index_contract_effectives_on_job_effective_id"
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
    t.integer "type_relationship", default: 1
    t.index ["career_id"], name: "index_employees_on_career_id"
    t.index ["cpf", "masp", "admission"], name: "index_employees_on_cpf_and_masp_and_admission", unique: true
  end

  create_table "hospitals", force: :cascade do |t|
    t.string "name"
    t.string "abbreviation"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "job_effectives", force: :cascade do |t|
    t.integer "status"
    t.date "start_date"
    t.date "finish_date"
    t.bigint "career_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "authorization"
    t.integer "workload"
    t.index ["career_id"], name: "index_job_effectives_on_career_id"
  end

  create_table "jobs", force: :cascade do |t|
    t.bigint "career_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "status", default: 1
    t.date "start_date"
    t.date "finish_date"
    t.string "why_switch"
    t.string "notice"
    t.date "notice_publish_date"
    t.integer "workload"
    t.integer "creation_type", default: 1
    t.bigint "job_id"
    t.bigint "authorization"
    t.integer "if_switch"
    t.index ["career_id"], name: "index_jobs_on_career_id"
    t.index ["job_id"], name: "index_jobs_on_job_id"
  end

  create_table "marks", force: :cascade do |t|
    t.integer "n_jobs"
    t.integer "n_workload"
    t.date "publication_date"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "restrictions", force: :cascade do |t|
    t.integer "type_restriction"
    t.string "description"
    t.date "start_date"
    t.date "finish_date"
    t.string "time"
    t.bigint "employee_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["employee_id"], name: "index_restrictions_on_employee_id"
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

  add_foreign_key "contract_effectives", "employees"
  add_foreign_key "contract_effectives", "hospitals"
  add_foreign_key "contract_effectives", "job_effectives"
  add_foreign_key "contracts", "employees"
  add_foreign_key "contracts", "hospitals"
  add_foreign_key "contracts", "jobs"
  add_foreign_key "employees", "careers"
  add_foreign_key "job_effectives", "careers"
  add_foreign_key "jobs", "careers"
  add_foreign_key "jobs", "jobs"
  add_foreign_key "restrictions", "employees"
end
