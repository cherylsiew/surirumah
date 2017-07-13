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

ActiveRecord::Schema.define(version: 20170709053634) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "products", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "category"
    t.string   "product_name"
    t.integer  "price"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.integer  "quantity"
    t.string   "size"
    t.json     "photos"
    t.index ["user_id"], name: "index_products_on_user_id", using: :btree
  end

  create_table "purchases", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "product_id"
    t.integer  "quantity"
    t.integer  "total_price"
    t.string   "transaction_id"
    t.string   "transaction_status"
    t.string   "fourdigits"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.index ["product_id"], name: "index_purchases_on_product_id", using: :btree
    t.index ["user_id"], name: "index_purchases_on_user_id", using: :btree
  end

  create_table "users", force: :cascade do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "password_digest"
    t.string   "email"
    t.string   "address1"
    t.string   "address2"
    t.string   "postcode"
    t.string   "country"
    t.string   "telephone"
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
    t.integer  "roles",           default: 0
  end

end
