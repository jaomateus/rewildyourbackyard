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

ActiveRecord::Schema[7.0].define(version: 2023_12_05_211227) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.bigint "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.string "service_name", null: false
    t.bigint "byte_size", null: false
    t.string "checksum"
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "active_storage_variant_records", force: :cascade do |t|
    t.bigint "blob_id", null: false
    t.string "variation_digest", null: false
    t.index ["blob_id", "variation_digest"], name: "index_active_storage_variant_records_uniqueness", unique: true
  end

  create_table "guilds", force: :cascade do |t|
    t.string "name"
    t.bigint "site_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "photo_cover"
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
    t.bigint "guild_id"
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
    t.string "address"
    t.date "starting_date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.float "latitude"
    t.float "longitude"
    t.string "cover_photo"
    t.bigint "user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "first_name"
    t.string "last_name"
    t.string "user_photo"
    t.string "profession"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "active_storage_variant_records", "active_storage_blobs", column: "blob_id"
  add_foreign_key "guilds", "sites"
  add_foreign_key "logs", "sites"
  add_foreign_key "site_plants", "guilds"
  add_foreign_key "site_plants", "plants"
  add_foreign_key "site_plants", "sites"
  add_foreign_key "sites", "users"
end
