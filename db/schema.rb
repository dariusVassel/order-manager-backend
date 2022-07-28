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

ActiveRecord::Schema[7.0].define(version: 2022_07_26_191817) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "contacts", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "email"
    t.string "company"
    t.string "country"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "items", force: :cascade do |t|
    t.string "species_name"
    t.string "scientific_name"
    t.string "color"
    t.string "physical_description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "order_inquiries", force: :cascade do |t|
    t.integer "item_id"
    t.string "product_name"
    t.integer "quantity"
    t.string "packing"
    t.string "glaze"
    t.date "shipment_date"
    t.string "contact_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "contact_id"
    t.integer "user_id"
    t.integer "order_item_id"
    t.string "status"
  end

  create_table "order_items", force: :cascade do |t|
    t.integer "order_id"
    t.integer "item_id"
    t.integer "kilos"
    t.integer "price_per_kg"
    t.integer "price_total"
    t.string "selected_size"
    t.string "selected_freeze"
    t.string "selected_glaze"
    t.string "catching_method"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "orders", force: :cascade do |t|
    t.string "order_status"
    t.date "po_date"
    t.integer "po_number"
    t.integer "internal_ref_number"
    t.integer "order_item_id"
    t.string "size"
    t.string "glaze"
    t.integer "price_kg"
    t.integer "cartons"
    t.string "packing"
    t.integer "kgs_carton"
    t.string "packing_specs"
    t.date "shipment_date"
    t.string "payment_terms"
    t.string "port_to"
    t.string "port_from"
    t.integer "order_total"
    t.string "selected_freeze"
    t.integer "total_kilos"
    t.bigint "buyer_id"
    t.bigint "seller_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["buyer_id"], name: "index_orders_on_buyer_id"
    t.index ["seller_id"], name: "index_orders_on_seller_id"
  end

  create_table "organizations", force: :cascade do |t|
    t.string "name"
    t.string "address"
    t.string "phone_number"
    t.string "email"
    t.string "logo_image_url"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "user_infos", force: :cascade do |t|
    t.integer "user_id"
    t.string "first_name"
    t.string "last_name"
    t.string "avatar_url"
    t.string "email"
    t.string "company_name"
    t.string "address"
    t.string "phone"
    t.integer "completed_orders"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "username"
    t.string "password_digest"
    t.string "role"
    t.integer "organization_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "orders", "users", column: "buyer_id"
  add_foreign_key "orders", "users", column: "seller_id"
end
