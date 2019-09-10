# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2019_09_10_080349) do

  create_table "active_storage_attachments", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.bigint "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.bigint "byte_size", null: false
    t.string "checksum", null: false
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "blog_details", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4", force: :cascade do |t|
    t.bigint "blog_id"
    t.string "title"
    t.text "description"
    t.text "content"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["blog_id"], name: "index_blog_details_on_blog_id"
  end

  create_table "blogs", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4", force: :cascade do |t|
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "impressions_count", default: 0
    t.bigint "location_id", null: false
    t.bigint "hashtags_id", null: false
    t.bigint "relative_categories_id", null: false
    t.bigint "host_id", null: false
    t.index ["hashtags_id"], name: "index_blogs_on_hashtags_id"
    t.index ["host_id"], name: "index_blogs_on_host_id"
    t.index ["location_id"], name: "index_blogs_on_location_id"
    t.index ["relative_categories_id"], name: "index_blogs_on_relative_categories_id"
  end

  create_table "categories", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4", force: :cascade do |t|
    t.string "category_name"
  end

  create_table "experience_details", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4", force: :cascade do |t|
    t.bigint "experience_id"
    t.decimal "price_adult", precision: 10
    t.decimal "price_children", precision: 10
    t.decimal "price_infant", precision: 10
    t.string "duration"
    t.string "age"
    t.string "language"
    t.string "title"
    t.text "description"
    t.text "content"
    t.index ["experience_id"], name: "index_experience_details_on_experience_id"
  end

  create_table "experiences", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4", force: :cascade do |t|
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "location_id", null: false
    t.bigint "host_id", null: false
    t.index ["host_id"], name: "index_experiences_on_host_id"
    t.index ["location_id"], name: "index_experiences_on_location_id"
  end

  create_table "hashtags", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4", force: :cascade do |t|
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "tag_id", null: false
    t.index ["tag_id"], name: "index_hashtags_on_tag_id"
  end

  create_table "hosts", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["email"], name: "index_hosts_on_email", unique: true
    t.index ["reset_password_token"], name: "index_hosts_on_reset_password_token", unique: true
  end

  create_table "impressions", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4", force: :cascade do |t|
    t.string "impressionable_type"
    t.integer "impressionable_id"
    t.integer "user_id"
    t.string "controller_name"
    t.string "action_name"
    t.string "view_name"
    t.string "request_hash"
    t.string "ip_address"
    t.string "session_hash"
    t.text "message"
    t.text "referrer"
    t.text "params"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["controller_name", "action_name", "ip_address"], name: "controlleraction_ip_index"
    t.index ["controller_name", "action_name", "request_hash"], name: "controlleraction_request_index"
    t.index ["controller_name", "action_name", "session_hash"], name: "controlleraction_session_index"
    t.index ["impressionable_type", "impressionable_id", "ip_address"], name: "poly_ip_index"
    t.index ["impressionable_type", "impressionable_id", "params"], name: "poly_params_request_index", length: { params: 255 }
    t.index ["impressionable_type", "impressionable_id", "request_hash"], name: "poly_request_index"
    t.index ["impressionable_type", "impressionable_id", "session_hash"], name: "poly_session_index"
    t.index ["impressionable_type", "message", "impressionable_id"], name: "impressionable_type_message_index", length: { message: 255 }
    t.index ["user_id"], name: "index_impressions_on_user_id"
  end

  create_table "locations", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4", force: :cascade do |t|
    t.string "province"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "relative_categories", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4", force: :cascade do |t|
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "category_id", null: false
    t.index ["category_id"], name: "index_relative_categories_on_category_id"
  end

  create_table "tags", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4", force: :cascade do |t|
    t.string "tag_name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "blog_details", "blogs"
  add_foreign_key "blogs", "hashtags", column: "hashtags_id"
  add_foreign_key "blogs", "hosts"
  add_foreign_key "blogs", "locations"
  add_foreign_key "blogs", "relative_categories", column: "relative_categories_id"
  add_foreign_key "experience_details", "experiences"
  add_foreign_key "experiences", "hosts"
  add_foreign_key "experiences", "locations"
  add_foreign_key "hashtags", "tags"
  add_foreign_key "relative_categories", "categories"
end
