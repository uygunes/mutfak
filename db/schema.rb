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

ActiveRecord::Schema.define(version: 20170717204539) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "alt_yemeks", force: :cascade do |t|
    t.string "isim"
    t.integer "yemek_kategori_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "kisi"
  end

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

  create_table "kategoris", force: :cascade do |t|
    t.string "isim"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "malzeme_altyemeks", force: :cascade do |t|
    t.bigint "malzeme_id"
    t.bigint "alt_yemek_id"
    t.float "miktar"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["alt_yemek_id"], name: "index_malzeme_altyemeks_on_alt_yemek_id"
    t.index ["malzeme_id"], name: "index_malzeme_altyemeks_on_malzeme_id"
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
    t.integer "kategori_id"
    t.index ["birim_id"], name: "index_malzemes_on_birim_id"
    t.index ["tedarikci_id"], name: "index_malzemes_on_tedarikci_id"
  end

  create_table "menu_altyemeks", force: :cascade do |t|
    t.bigint "menu_id"
    t.bigint "altyemek_id"
    t.integer "kisi"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["altyemek_id"], name: "index_menu_altyemeks_on_altyemek_id"
    t.index ["menu_id"], name: "index_menu_altyemeks_on_menu_id"
  end

  create_table "menu_yemeks", force: :cascade do |t|
    t.bigint "menu_id"
    t.bigint "yemek_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "kisi"
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
    t.integer "ogun_id"
    t.integer "restoran_id"
  end

  create_table "oguns", force: :cascade do |t|
    t.string "isim"
    t.time "baslangic"
    t.time "bitis"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "restoran_oguns", force: :cascade do |t|
    t.integer "restoran_id"
    t.integer "ogun_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "restorans", force: :cascade do |t|
    t.string "isim"
    t.integer "kisi"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "yemek_altyemeks", force: :cascade do |t|
    t.integer "yemek_id"
    t.integer "alt_yemek_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "kisi"
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
    t.integer "kategori_id"
  end

end
