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

ActiveRecord::Schema.define(version: 2018_04_30_094512) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "commands", force: :cascade do |t|
    t.string "name", null: false
    t.json "params"
    t.boolean "execute", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "granularities", force: :cascade do |t|
    t.string "name", null: false
    t.integer "value", null: false
    t.string "label"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "instruments", force: :cascade do |t|
    t.string "name", null: false
    t.string "label", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "notifications", force: :cascade do |t|
    t.string "kind", null: false
    t.string "info", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "orders", force: :cascade do |t|
    t.bigint "strategy_id"
    t.decimal "price_buy", null: false
    t.decimal "price_sell"
    t.integer "units", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.datetime "time_buy", null: false
    t.datetime "time_sell"
    t.integer "oanda_buy_order_id", null: false
    t.integer "oanda_sell_order_id"
    t.index ["strategy_id"], name: "index_orders_on_strategy_id"
  end

  create_table "prices", force: :cascade do |t|
    t.datetime "time", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "strategy_id"
    t.decimal "open", null: false
    t.decimal "high", null: false
    t.decimal "low", null: false
    t.decimal "close", null: false
    t.integer "volume", null: false
    t.index ["strategy_id", "time"], name: "index_prices_on_strategy_id_and_time", unique: true
    t.index ["strategy_id"], name: "index_prices_on_strategy_id"
  end

  create_table "strategies", force: :cascade do |t|
    t.string "name", null: false
    t.bigint "instrument_id"
    t.bigint "strategy_logic_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "granularity_id"
    t.integer "units"
    t.integer "status", default: 0, null: false
    t.index ["granularity_id"], name: "index_strategies_on_granularity_id"
    t.index ["instrument_id"], name: "index_strategies_on_instrument_id"
    t.index ["strategy_logic_id"], name: "index_strategies_on_strategy_logic_id"
  end

  create_table "strategy_logics", force: :cascade do |t|
    t.string "class_name", null: false
    t.string "label", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet "current_sign_in_ip"
    t.inet "last_sign_in_ip"
    t.integer "failed_attempts", default: 0, null: false
    t.string "unlock_token"
    t.datetime "locked_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "role", default: "guest"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
    t.index ["unlock_token"], name: "index_users_on_unlock_token", unique: true
  end

  add_foreign_key "orders", "strategies"
  add_foreign_key "prices", "strategies"
  add_foreign_key "strategies", "granularities"
  add_foreign_key "strategies", "instruments"
  add_foreign_key "strategies", "strategy_logics"
end
