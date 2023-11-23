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

ActiveRecord::Schema[7.0].define(version: 2023_11_23_114802) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "guilds", force: :cascade do |t|
    t.string "name"
    t.bigint "site_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["site_id"], name: "index_guilds_on_site_id"
  end

  create_table "logs", force: :cascade do |t|
    t.string "title"
    t.text "description"
    t.integer "site_plant_id"
    t.integer "guild_id"
    t.bigint "site_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["site_id"], name: "index_logs_on_site_id"
  end

  create_table "plants", force: :cascade do |t|
    t.string "scientific_name"
    t.string "common_name"
    t.string "type"
    t.string "family"
    t.string "genus"
    t.string "image_url"
    t.string "id_trefle"
    t.date "planted_on"
    t.text "observations"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "site_plants", force: :cascade do |t|
    t.text "observations"
    t.date "planted_on"
    t.bigint "site_id", null: false
    t.bigint "plant_id", null: false
    t.bigint "guild_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["guild_id"], name: "index_site_plants_on_guild_id"
    t.index ["plant_id"], name: "index_site_plants_on_plant_id"
    t.index ["site_id"], name: "index_site_plants_on_site_id"
  end

  create_table "sites", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.string "project_type"
    t.string "location"
    t.date "starting_date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "guilds", "sites"
  add_foreign_key "logs", "sites"
  add_foreign_key "site_plants", "guilds"
  add_foreign_key "site_plants", "plants"
  add_foreign_key "site_plants", "sites"
end
