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

ActiveRecord::Schema.define(version: 20150425191620) do

  create_table "addresses", force: :cascade do |t|
    t.string   "address_line1"
    t.string   "address_line2"
    t.string   "city"
    t.string   "province"
    t.string   "country"
    t.string   "postal_code"
    t.integer  "shop_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  add_index "addresses", ["shop_id"], name: "index_addresses_on_shop_id"

  create_table "contact_infos", force: :cascade do |t|
    t.integer  "shop_id"
    t.string   "telephone_number"
    t.string   "fax_number"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
  end

  add_index "contact_infos", ["shop_id"], name: "index_contact_infos_on_shop_id"

  create_table "diet_ingredient_types", force: :cascade do |t|
    t.integer  "diet_id"
    t.integer  "ingredient_type_id"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
  end

  add_index "diet_ingredient_types", ["diet_id"], name: "index_diet_ingredient_types_on_diet_id"
  add_index "diet_ingredient_types", ["ingredient_type_id"], name: "index_diet_ingredient_types_on_ingredient_type_id"

  create_table "dietary_preferences", force: :cascade do |t|
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "diet_id"
  end

  add_index "dietary_preferences", ["diet_id"], name: "index_dietary_preferences_on_diet_id"
  add_index "dietary_preferences", ["user_id"], name: "index_dietary_preferences_on_user_id"

  create_table "diets", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "excluded_ingredients", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "ingredient_availabilities", force: :cascade do |t|
    t.integer  "ingredient_id"
    t.integer  "month_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  add_index "ingredient_availabilities", ["ingredient_id"], name: "index_ingredient_availabilities_on_ingredient_id"
  add_index "ingredient_availabilities", ["month_id"], name: "index_ingredient_availabilities_on_month_id"

  create_table "ingredient_types", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "ingredients", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.integer  "ingredient_type_id"
  end

  add_index "ingredients", ["ingredient_type_id"], name: "index_ingredients_on_ingredient_type_id"

  create_table "months", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "operating_hours", force: :cascade do |t|
    t.string   "day_of_week"
    t.time     "start_time"
    t.time     "end_time"
    t.boolean  "is_weekend_hours"
    t.integer  "shop_id"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
  end

  add_index "operating_hours", ["shop_id"], name: "index_operating_hours_on_shop_id"

  create_table "profiles", force: :cascade do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "city"
    t.string   "postal_code"
    t.integer  "user_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "profiles", ["user_id"], name: "index_profiles_on_user_id"

  create_table "recipe_ingredient_quantities", force: :cascade do |t|
    t.integer  "recipe_id"
    t.integer  "ingredient_id"
    t.decimal  "quantity"
    t.string   "quantity_unit"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  add_index "recipe_ingredient_quantities", ["ingredient_id"], name: "index_recipe_ingredient_quantities_on_ingredient_id"
  add_index "recipe_ingredient_quantities", ["recipe_id"], name: "index_recipe_ingredient_quantities_on_recipe_id"

  create_table "recipes", force: :cascade do |t|
    t.string   "name"
    t.text     "instructions"
    t.integer  "prep_time"
    t.string   "meal_type"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  create_table "shop_ingredients", force: :cascade do |t|
    t.integer  "shop_id"
    t.integer  "ingredients_id"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  add_index "shop_ingredients", ["ingredients_id"], name: "index_shop_ingredients_on_ingredients_id"
  add_index "shop_ingredients", ["shop_id"], name: "index_shop_ingredients_on_shop_id"

  create_table "shopping_list_items", force: :cascade do |t|
    t.boolean  "done"
    t.integer  "shopping_list_id"
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
    t.string   "ingredient_name"
    t.decimal  "ingredient_quantity"
    t.string   "ingredient_quantity_unit"
  end

  add_index "shopping_list_items", ["shopping_list_id"], name: "index_shopping_list_items_on_shopping_list_id"

  create_table "shopping_lists", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "name"
  end

  create_table "shops", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "name"
  end

  create_table "user_favourite_recipes", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "recipe_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "user_favourite_recipes", ["recipe_id"], name: "index_user_favourite_recipes_on_recipe_id"
  add_index "user_favourite_recipes", ["user_id"], name: "index_user_favourite_recipes_on_user_id"

  create_table "user_favourite_shops", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "shop_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "user_favourite_shops", ["shop_id"], name: "index_user_favourite_shops_on_shop_id"
  add_index "user_favourite_shops", ["user_id"], name: "index_user_favourite_shops_on_user_id"

  create_table "user_yummly_preferences", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "yummly_diet_id"
    t.integer  "yummly_allergy_id"
    t.integer  "excluded_ingredient_id"
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  add_index "user_yummly_preferences", ["excluded_ingredient_id"], name: "index_user_yummly_preferences_on_excluded_ingredient_id"
  add_index "user_yummly_preferences", ["user_id"], name: "index_user_yummly_preferences_on_user_id"
  add_index "user_yummly_preferences", ["yummly_allergy_id"], name: "index_user_yummly_preferences_on_yummly_allergy_id"
  add_index "user_yummly_preferences", ["yummly_diet_id"], name: "index_user_yummly_preferences_on_yummly_diet_id"

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "user_category"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

  create_table "web_infos", force: :cascade do |t|
    t.string   "email"
    t.string   "website"
    t.string   "facebook"
    t.string   "twitter"
    t.integer  "shop_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "web_infos", ["shop_id"], name: "index_web_infos_on_shop_id"

  create_table "yummly_allergies", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "yummly_diets", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
