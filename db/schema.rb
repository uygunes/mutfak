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

ActiveRecord::Schema.define(version: 20170714095030) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "birims", force: :cascade do |t|
    t.string "isim"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "controllers", force: :cascade do |t|
    t.string "Birim"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "malzeme_kategoris", force: :cascade do |t|
    t.string "isim"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "malzemes", force: :cascade do |t|
    t.string "isim"
    t.integer "birim_id"
    t.float "fiyat"
    t.integer "tedarikci_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "malzeme_kategori_id"
    t.index ["birim_id"], name: "index_malzemes_on_birim_id"
    t.index ["tedarikci_id"], name: "index_malzemes_on_tedarikci_id"
  end

  create_table "menu_yemeks", force: :cascade do |t|
    t.bigint "menu_id"
    t.bigint "yemek_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["menu_id"], name: "index_menu_yemeks_on_menu_id"
    t.index ["yemek_id"], name: "index_menu_yemeks_on_yemek_id"
  end

  create_table "menus", force: :cascade do |t|
    t.string "isim"
    t.date "tarih"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "kisi"
    t.boolean "is_active"
  end

  create_table "yemek_kategoris", force: :cascade do |t|
    t.string "isim"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "yemek_malzemes", force: :cascade do |t|
    t.bigint "malzeme_id"
    t.bigint "yemek_id"
    t.float "miktar"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["malzeme_id"], name: "index_yemek_malzemes_on_malzeme_id"
    t.index ["yemek_id"], name: "index_yemek_malzemes_on_yemek_id"
  end

  create_table "yemeks", force: :cascade do |t|
    t.string "isim"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "kisi"
    t.integer "yemek_kategori_id"
  end

end
