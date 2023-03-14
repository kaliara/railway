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

ActiveRecord::Schema[7.0].define(version: 2023_03_14_014650) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "passwordless_sessions", force: :cascade do |t|
    t.string "authenticatable_type"
    t.bigint "authenticatable_id"
    t.datetime "timeout_at", precision: nil, null: false
    t.datetime "expires_at", precision: nil, null: false
    t.datetime "claimed_at", precision: nil
    t.text "user_agent", null: false
    t.string "remote_addr", null: false
    t.string "token", null: false
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.index ["authenticatable_type", "authenticatable_id"], name: "authenticatable"
  end

  create_table "reservations", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.string "first_name"
    t.string "last_name"
    t.integer "guests_adults"
    t.integer "guests_children"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "attending", default: false
    t.boolean "attending_friday", default: false
    t.boolean "attending_saturday", default: false
    t.boolean "attending_sunday", default: false
    t.boolean "staying_onsite", default: false
    t.boolean "accommodation_rv", default: false
    t.boolean "accommodation_tent", default: false
    t.boolean "accommodation_cabin", default: false
    t.boolean "accommodation_hotel", default: false
    t.string "cabin_number"
    t.string "cabin_mate_request"
    t.string "cabin_own_linens", default: "false"
    t.string "hotel_name"
    t.boolean "designated_driver_plan", default: false
    t.string "food_allergies"
    t.string "dietary_preferences"
    t.string "additional_comments"
    t.string "guest_names"
    t.boolean "meal_friday_dinner", default: false
    t.boolean "meal_saturday_breakfast", default: false
    t.boolean "meal_saturday_lunch", default: false
    t.boolean "meal_saturday_dinner", default: false
    t.boolean "meal_saturday_snack", default: false
    t.boolean "meal_sunday_brunch", default: false
    t.boolean "optional_completed", default: false
    t.string "cabin_own_linens_description"
    t.integer "activity_preference_climbing_wall", default: 1
    t.integer "activity_preference_swimming_pool", default: 2
    t.integer "activity_preference_gokarts", default: 3
    t.integer "activity_preference_slipnslide", default: 4
    t.integer "activity_preference_paint_night", default: 5
    t.integer "activity_preference_archery", default: 6
    t.integer "activity_preference_zipline", default: 7
    t.index ["user_id"], name: "index_reservations_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "instant_login_token"
    t.string "invite_names"
  end

  add_foreign_key "reservations", "users"
end
