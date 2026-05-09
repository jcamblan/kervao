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

ActiveRecord::Schema[8.1].define(version: 2026_05_08_100513) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "pg_catalog.plpgsql"

  create_table "active_storage_attachments", force: :cascade do |t|
    t.bigint "blob_id", null: false
    t.datetime "created_at", null: false
    t.string "name", null: false
    t.bigint "record_id", null: false
    t.string "record_type", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.bigint "byte_size", null: false
    t.string "checksum"
    t.string "content_type"
    t.datetime "created_at", null: false
    t.string "filename", null: false
    t.string "key", null: false
    t.text "metadata"
    t.string "service_name", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "active_storage_variant_records", force: :cascade do |t|
    t.bigint "blob_id", null: false
    t.string "variation_digest", null: false
    t.index ["blob_id", "variation_digest"], name: "index_active_storage_variant_records_uniqueness", unique: true
  end

  create_table "contact_infos", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.string "email"
    t.string "phone_number"
    t.jsonb "translations", default: {}, null: false
    t.datetime "updated_at", null: false
  end

  create_table "cottage_details", force: :cascade do |t|
    t.bigint "cottage_id", null: false
    t.datetime "created_at", null: false
    t.integer "position", default: 0, null: false
    t.jsonb "translations", default: {}, null: false
    t.datetime "updated_at", null: false
    t.index ["cottage_id"], name: "index_cottage_details_on_cottage_id"
  end

  create_table "cottages", force: :cascade do |t|
    t.integer "beddings", default: 0, null: false
    t.datetime "created_at", null: false
    t.boolean "disabled_access", default: false, null: false
    t.integer "parking_lot_count", default: 0, null: false
    t.integer "position", default: 0, null: false
    t.string "reference", null: false
    t.integer "room_count", default: 0, null: false
    t.string "surface"
    t.jsonb "translations", default: {}, null: false
    t.datetime "updated_at", null: false
    t.integer "washroom_count", default: 0, null: false
    t.index ["reference"], name: "index_cottages_on_reference", unique: true
    t.index ["translations"], name: "index_cottages_on_translations", using: :gin
  end

  create_table "home_pages", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.jsonb "translations", default: {}, null: false
    t.datetime "updated_at", null: false
  end

  create_table "pricing_periods", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.integer "position", default: 0, null: false
    t.bigint "pricing_id", null: false
    t.jsonb "translations", default: {}, null: false
    t.datetime "updated_at", null: false
    t.index ["pricing_id"], name: "index_pricing_periods_on_pricing_id"
  end

  create_table "pricing_rates", force: :cascade do |t|
    t.bigint "cottage_id", null: false
    t.datetime "created_at", null: false
    t.decimal "price", precision: 8, scale: 2, null: false
    t.bigint "pricing_period_id", null: false
    t.datetime "updated_at", null: false
    t.index ["cottage_id"], name: "index_pricing_rates_on_cottage_id"
    t.index ["pricing_period_id", "cottage_id"], name: "index_pricing_rates_on_pricing_period_id_and_cottage_id", unique: true
    t.index ["pricing_period_id"], name: "index_pricing_rates_on_pricing_period_id"
  end

  create_table "pricings", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.jsonb "translations", default: {}, null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "active_storage_variant_records", "active_storage_blobs", column: "blob_id"
  add_foreign_key "cottage_details", "cottages"
  add_foreign_key "pricing_periods", "pricings"
  add_foreign_key "pricing_rates", "cottages"
  add_foreign_key "pricing_rates", "pricing_periods"
end
