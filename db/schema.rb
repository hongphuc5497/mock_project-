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

ActiveRecord::Schema.define(version: 2019_09_05_101802) do

  create_table "blog_details", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4", force: :cascade do |t|
    t.bigint "blog_id"
    t.string "title"
    t.text "content"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["blog_id"], name: "index_blog_details_on_blog_id"
  end

  create_table "blogs", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4", force: :cascade do |t|
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "impressions_count", default: 0
    t.bigint "location_id"
    t.index ["location_id"], name: "index_blogs_on_location_id"
  end

  create_table "categories", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4", force: :cascade do |t|
    t.string "category_name"
  end

  create_table "hashtags", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4", force: :cascade do |t|
    t.bigint "blog_id"
    t.bigint "tag_id"
    t.index ["blog_id"], name: "index_hashtags_on_blog_id"
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
    t.bigint "blog_id"
    t.bigint "category_id"
    t.index ["blog_id"], name: "index_relative_categories_on_blog_id"
    t.index ["category_id"], name: "index_relative_categories_on_category_id"
  end

  create_table "tags", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4", force: :cascade do |t|
    t.string "tag_name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
