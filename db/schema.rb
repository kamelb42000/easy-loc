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

ActiveRecord::Schema[7.0].define(version: 2023_07_27_130819) do
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

  create_table "candidatures", force: :cascade do |t|
    t.text "content"
    t.string "status", default: "pending"
    t.bigint "user_id", null: false
    t.bigint "realty_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["realty_id"], name: "index_candidatures_on_realty_id"
    t.index ["user_id"], name: "index_candidatures_on_user_id"
  end

  create_table "claims", force: :cascade do |t|
    t.string "title"
    t.text "content"
    t.bigint "realty_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "tenant_id"
    t.string "status", default: "pending"
    t.index ["realty_id"], name: "index_claims_on_realty_id"
  end

  create_table "documents", force: :cascade do |t|
    t.string "name"
    t.bigint "realty_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["realty_id"], name: "index_documents_on_realty_id"
  end

  create_table "messages", force: :cascade do |t|
    t.text "content"
    t.bigint "realty_id", null: false
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["realty_id"], name: "index_messages_on_realty_id"
    t.index ["user_id"], name: "index_messages_on_user_id"
  end

  create_table "realties", force: :cascade do |t|
    t.string "name"
    t.string "address"
    t.string "category"
    t.string "rent"
    t.date "payment_date"
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_realties_on_user_id"
  end

  create_table "tenants", force: :cascade do |t|
    t.date "enter_date"
    t.date "out_date"
    t.bigint "realty_id", null: false
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["realty_id"], name: "index_tenants_on_realty_id"
    t.index ["user_id"], name: "index_tenants_on_user_id"
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
    t.string "phone_number"
    t.string "address"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "active_storage_variant_records", "active_storage_blobs", column: "blob_id"
  add_foreign_key "candidatures", "realties"
  add_foreign_key "candidatures", "users"
  add_foreign_key "claims", "realties"
  add_foreign_key "documents", "realties"
  add_foreign_key "messages", "realties"
  add_foreign_key "messages", "users"
  add_foreign_key "realties", "users"
  add_foreign_key "tenants", "realties"
  add_foreign_key "tenants", "users"
end
