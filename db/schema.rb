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

ActiveRecord::Schema.define(version: 20170930205154) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "brewerydb_availabilities", force: :cascade do |t|
    t.text     "external_id"
    t.text     "name"
    t.text     "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "brewerydb_beers", force: :cascade do |t|
    t.text     "external_id"
    t.text     "name"
    t.text     "name_display"
    t.text     "description"
    t.text     "abv"
    t.text     "ibu"
    t.text     "available_id"
    t.text     "style_id"
    t.text     "is_organic"
    t.text     "status"
    t.text     "glassware_id"
    t.text     "food_pairings"
    t.text     "original_gravity"
    t.text     "serving_temperature"
    t.text     "serving_temperature_display"
    t.text     "update_date"
    t.text     "create_date"
    t.text     "icon"
    t.text     "brewery_id"
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
    t.text     "brewery_name"
  end

  create_table "brewerydb_breweries", force: :cascade do |t|
    t.text     "external_id"
    t.text     "name"
    t.text     "name_short_display"
    t.text     "description"
    t.text     "website"
    t.text     "is_organic"
    t.text     "status"
    t.text     "street_address"
    t.text     "locality"
    t.text     "region"
    t.text     "postal_code"
    t.text     "phone"
    t.text     "latitude"
    t.text     "longitude"
    t.text     "is_closed"
    t.text     "is_primary"
    t.text     "open_to_public"
    t.text     "location_type"
    t.text     "location_type_display"
    t.text     "country_iso_code"
    t.text     "update_date"
    t.text     "create_date"
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
  end

  create_table "brewerydb_categories", force: :cascade do |t|
    t.text     "external_id"
    t.text     "name"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "brewerydb_glasswares", force: :cascade do |t|
    t.text     "external_id"
    t.text     "name"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "brewerydb_locations", force: :cascade do |t|
    t.text     "external_id"
    t.text     "name"
    t.text     "street_address"
    t.text     "extended_address"
    t.text     "locality"
    t.text     "region"
    t.text     "postal_code"
    t.text     "phone"
    t.text     "website"
    t.text     "hours_of_operation"
    t.text     "hours_of_operation_explicit"
    t.text     "hours_of_operation_notes"
    t.text     "tour_info"
    t.text     "timezone_id"
    t.text     "latitude"
    t.text     "longitude"
    t.text     "is_primary"
    t.text     "in_planning"
    t.text     "is_closed"
    t.text     "open_to_public"
    t.text     "location_type"
    t.text     "location_type_display"
    t.text     "country_iso_code"
    t.text     "year_opened"
    t.text     "brewery_id"
    t.text     "status"
    t.text     "update_date"
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
  end

  create_table "brewerydb_styles", force: :cascade do |t|
    t.text     "external_id"
    t.text     "category_id"
    t.text     "name"
    t.text     "short_name"
    t.text     "description"
    t.text     "ibu_min"
    t.text     "ibu_max"
    t.text     "abv_min"
    t.text     "abv_max"
    t.text     "srm_min"
    t.text     "srm_max"
    t.text     "og_min"
    t.text     "fg_min"
    t.text     "fg_max"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "trainer_beer_ratings", force: :cascade do |t|
    t.text     "beer_external_id"
    t.integer  "trainer_id"
    t.integer  "rating"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.index ["beer_external_id"], name: "index_trainer_beer_ratings_on_beer_external_id", using: :btree
    t.index ["trainer_id"], name: "index_trainer_beer_ratings_on_trainer_id", using: :btree
  end

  create_table "trainers", force: :cascade do |t|
    t.text     "identifier"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
