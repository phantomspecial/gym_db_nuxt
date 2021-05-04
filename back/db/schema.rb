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

ActiveRecord::Schema.define(version: 2020_11_02_153257) do

  create_table "gym_basic_infos", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "master_gym_id", null: false, comment: "ジム名"
    t.bigint "master_prefecture_id", null: false, comment: "都道府県"
    t.string "shop_name", null: false, comment: "店舗名"
    t.string "post_address", null: false, comment: "郵便番号"
    t.string "tel_no", null: false, comment: "電話番号"
    t.string "address", null: false, comment: "住所"
    t.string "url", null: false, comment: "URL"
    t.text "access", comment: "アクセス"
    t.text "opening_hours", null: false, comment: "営業日・休館日"
    t.text "parking", comment: "駐車場・駐輪場"
    t.text "facility", comment: "ジム設備"
    t.text "other_info1", comment: "その他情報1"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["master_gym_id"], name: "index_gym_basic_infos_on_master_gym_id"
    t.index ["master_prefecture_id"], name: "index_gym_basic_infos_on_master_prefecture_id"
  end

  create_table "master_gyms", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "gym_name", null: false, comment: "ジム名"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "master_prefectures", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.integer "sort_no", null: false, comment: "ソートNo"
    t.string "name", null: false, comment: "都道府県名"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
