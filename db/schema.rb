# encoding: UTF-8
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

ActiveRecord::Schema.define(version: 20150224134543) do

  create_table "categories", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "customers", force: :cascade do |t|
    t.string   "first_name", limit: 255
    t.string   "last_name",  limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "order_products", force: :cascade do |t|
    t.integer "quantity",   limit: 4
    t.integer "product_id", limit: 4
    t.integer "order_id",   limit: 4
  end

  add_index "order_products", ["order_id"], name: "index_order_products_on_order_id", using: :btree
  add_index "order_products", ["product_id"], name: "index_order_products_on_product_id", using: :btree

  create_table "orders", force: :cascade do |t|
    t.string   "deal",        limit: 255
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
    t.integer  "customer_id", limit: 4
    t.datetime "order_at"
  end

  create_table "product_categories", force: :cascade do |t|
    t.integer "product_id",  limit: 4
    t.integer "category_id", limit: 4
  end

  add_index "product_categories", ["category_id"], name: "index_product_categories_on_category_id", using: :btree
  add_index "product_categories", ["product_id"], name: "index_product_categories_on_product_id", using: :btree

  create_table "products", force: :cascade do |t|
    t.string   "name",              limit: 255
    t.decimal  "price",                         precision: 8, scale: 2
    t.integer  "quantity",          limit: 4
    t.integer  "status",            limit: 4
    t.integer  "recurring_billing", limit: 4
    t.decimal  "trial_price",                   precision: 8, scale: 2
    t.datetime "created_at",                                            null: false
    t.datetime "updated_at",                                            null: false
  end

  add_foreign_key "order_products", "orders"
  add_foreign_key "order_products", "products"
  add_foreign_key "product_categories", "categories"
  add_foreign_key "product_categories", "products"
end
