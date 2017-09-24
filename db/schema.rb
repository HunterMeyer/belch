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

ActiveRecord::Schema.define(version: 20170924002634) do

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

end
