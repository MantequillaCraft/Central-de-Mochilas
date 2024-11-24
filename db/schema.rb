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

ActiveRecord::Schema[7.1].define(version: 2024_11_24_182626) do
  create_table "change_histories", force: :cascade do |t|
    t.date "modification_date"
    t.string "change_description"
    t.integer "product_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["product_id"], name: "index_change_histories_on_product_id"
  end

  create_table "currents", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "customers", force: :cascade do |t|
    t.string "customer_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "products", force: :cascade do |t|
    t.string "product_name"
    t.string "product_type"
    t.integer "quantity_available"
    t.float "unit_price"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "supplier_id", null: false
    t.index ["supplier_id"], name: "index_products_on_supplier_id"
  end

  create_table "reserve_or_purchases", force: :cascade do |t|
    t.integer "desired_quantity"
    t.string "payment_method"
    t.integer "product_id", null: false
    t.integer "customer_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["customer_id"], name: "index_reserve_or_purchases_on_customer_id"
    t.index ["product_id"], name: "index_reserve_or_purchases_on_product_id"
  end

  create_table "sales_reports", force: :cascade do |t|
    t.integer "product_id", null: false
    t.float "daily_earnings"
    t.integer "products_sold_quantity"
    t.text "products_sold"
    t.date "report_date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["product_id"], name: "index_sales_reports_on_product_id"
  end

  create_table "suppliers", force: :cascade do |t|
    t.string "supplier_name"
    t.string "supplier_phone"
    t.string "supplier_address"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "username", null: false
    t.string "password_digest", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["username"], name: "index_users_on_username", unique: true
  end

  add_foreign_key "change_histories", "products"
  add_foreign_key "products", "suppliers"
  add_foreign_key "reserve_or_purchases", "customers"
  add_foreign_key "reserve_or_purchases", "products"
  add_foreign_key "sales_reports", "products"
end
