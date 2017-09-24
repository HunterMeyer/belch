class CreateBrewerydbBeers < ActiveRecord::Migration[5.0]
  def change
    create_table :brewerydb_beers do |t|
      t.text :external_id
      t.text :name
      t.text :name_display
      t.text :description
      t.text :abv
      t.text :ibu
      t.text :available_id
      t.text :style_id
      t.text :is_organic
      t.text :status
      t.text :glassware_id
      t.text :food_pairings
      t.text :original_gravity
      t.text :serving_temperature
      t.text :serving_temperature_display
      t.text :update_date
      t.text :create_date
      t.text :icon
      t.text :brewery_id

      t.timestamps
    end
  end
end
